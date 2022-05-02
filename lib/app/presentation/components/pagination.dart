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
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(100),
          child: const Icon(Icons.arrow_left, size: 30),
          onTap: () => backPage(),
        ),
        const SizedBox(width: 15),
        Text(
          '$page/$totalPages',
          style: const TextStyle(fontSize: 22),
        ),
        const SizedBox(width: 15),
        InkWell(
          borderRadius: BorderRadius.circular(100),
          child: const Icon(Icons.arrow_right, size: 30),
          onTap: () => advancePage(),
        ),
      ],
    );
  }
}
