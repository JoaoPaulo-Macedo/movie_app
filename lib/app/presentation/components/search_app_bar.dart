import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:movie_app/app/presentation/pages/list_page/list_controller.dart';

class SearchAppBar extends StatelessWidget {
  const SearchAppBar(this.controller, {Key? key}) : super(key: key);

  final ListController controller;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return AppBar(
          leading: controller.isSearching ? const SizedBox() : null,
          actions: [
            if (!controller.isSearching && !controller.isLoading)
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  controller.isSearching = true;
                  controller.searchFocus.requestFocus();
                },
              ),
            if (controller.isSearching) _SearchAppBarAction(controller: controller),
          ],
        );
      },
    );
  }
}

class _SearchAppBarAction extends StatelessWidget {
  const _SearchAppBarAction({
    Key? key,
    required this.controller,
  }) : super(key: key);

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
              onPressed: () => controller.onSearch(null),
            ),
          ),
          onChanged: controller.onSearch,
        ),
      ),
    );
  }
}
