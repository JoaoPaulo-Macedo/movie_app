import 'package:flutter/material.dart';
import 'package:movie_app/presentation/controllers/home_controller.dart';

class SearchAppBarAction extends StatelessWidget {
  const SearchAppBarAction({Key? key, required this.controller}) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    if (!controller.isSearching) {
      return IconButton(
        icon: const Icon(Icons.search),
        onPressed: () {
          controller.isSearching = true;
          controller.searchFocus.requestFocus();
        },
      );
    } else {
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
                  controller.onChanged('');
                  controller.isSearching = false;
                },
              ),
            ),
            onChanged: controller.onChanged,
          ),
        ),
      );
    }
  }
}
