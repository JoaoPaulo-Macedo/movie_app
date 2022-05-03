import 'package:flutter/material.dart';

class Pagination extends StatelessWidget {
  const Pagination({
    Key? key,
    required this.page,
    required this.totalPages,
    required this.backPage,
    required this.advancePage,
  }) : super(key: key);

  final int page;
  final int totalPages;
  final Function backPage;
  final Function advancePage;

  @override
  Widget build(BuildContext context) {
    var cardColor = Theme.of(context).cardColor.withOpacity(0.85);

    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Material(
              color: cardColor,
              child: InkWell(
                child: const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Icon(Icons.arrow_back_ios_new_rounded, size: 30),
                ),
                onTap: () => backPage(),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: cardColor,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Text(
              '$page/$totalPages',
              style: const TextStyle(fontSize: 22),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Material(
              color: cardColor,
              child: InkWell(
                child: const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Icon(Icons.arrow_forward_ios_rounded, size: 30),
                ),
                onTap: () => advancePage(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
