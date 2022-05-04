import 'package:flutter/material.dart';
import 'package:movie_app/app/presentation/components/app_cards.dart';

enum AppListType { lists, movies }

class AppList extends StatelessWidget {
  const AppList({
    Key? key,
    required this.itemCount,
    required this.onTap,
    required this.type,
    required this.list,
  }) : super(key: key);

  final int itemCount;
  final List list;
  final Function onTap;
  final AppListType type;

  @override
  Widget build(BuildContext context) {
    if (type == AppListType.lists) {
      return ListView.separated(
        itemCount: itemCount,
        padding: EdgeInsets.zero,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (_, index) {
          return ListCard(list[index], onTap);
        },
      );
    }

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        mainAxisSpacing: 15,
        childAspectRatio: 0.6656,
      ),
      itemCount: itemCount,
      itemBuilder: (_, index) {
        return MovieCard(list[index], onTap);
      },
    );
  }
}
