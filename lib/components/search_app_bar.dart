import 'package:flutter/material.dart';

class SearchAppBar extends StatelessWidget {
  SearchAppBar({
    Key? key,
    required this.isSearching,
    required this.focus,
    required this.textController,
    required this.onChanged,
    required this.setState,
  }) : super(key: key);

  bool isSearching;
  final FocusNode focus;
  final TextEditingController textController;
  final Function(String value) onChanged;
  final Function() setState;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Visibility(
        visible: !isSearching,
        child: IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
      ),
      actions: [
        Visibility(
          visible: isSearching,
          child: Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                controller: textController,
                focusNode: focus,
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
                      textController.clear();
                      onChanged('');
                      isSearching = false;
                      setState();
                    },
                  ),
                ),
                onChanged: onChanged,
              ),
            ),
          ),
        ),
        Visibility(
          visible: !isSearching,
          child: IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              isSearching = true;
              focus.requestFocus();
              setState();
            },
          ),
        ),
      ],
    );
  }
}
