import 'package:flutter/material.dart';
import 'package:movie_app/app/presentation/pages/common/list_controller.dart';
import 'package:movie_app/app/presentation/pages/movies_list/movies_list_controller.dart';

class SearchAppBarAction extends StatelessWidget {
  const SearchAppBarAction({
    Key? key,
    required this.controller,
    // required this.textController,
    // required this.searchFocus,
    // required this.onSearch,
  }) : super(key: key);

  final ListController controller;
  // final TextEditingController textController;
  // final FocusNode searchFocus;
  // final Function(String?) onSearch;

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
              onPressed: () => controller.onSearch(null),
            ),
          ),
          onChanged: controller.onSearch,
        ),
      ),
    );
  }
}
