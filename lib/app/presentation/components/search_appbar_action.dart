import 'package:flutter/material.dart';
import 'package:movie_app/app/presentation/pages/list/list_controller.dart';

class SearchAppBarAction extends StatelessWidget {
  const SearchAppBarAction({Key? key, required this.controller}) : super(key: key);

  final ListController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: TextField(
          controller: controller.textController,
          focusNode: controller.searchFocus,
          cursorColor: Colors.white,
          textCapitalization: TextCapitalization.words,
          maxLength: 20,
          buildCounter: null,
          style: const TextStyle(fontSize: 18),
          decoration: InputDecoration(
            hintText: 'Search...',
            counterText: '',
            contentPadding: const EdgeInsets.fromLTRB(10, 15, 0, 0),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            suffixIcon: IconButton(
              icon: const Icon(Icons.close, color: Colors.white),
              onPressed: () {
                controller.textController.clear();
                controller.onSearch('');
                controller.isSearching = false;
              },
            ),
          ),
          onChanged: controller.onSearch,
        ),
      ),
    );
  }
}
