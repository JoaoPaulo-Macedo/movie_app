import 'package:flutter/material.dart';
import 'package:movie_app/app/domain/entities/movie_entity.dart';
import 'package:movie_app/app/presentation/components/app_cards.dart';
import 'package:movie_app/app/presentation/pages/home/home_controller.dart';
import 'package:movie_app/app/presentation/pages/theme.dart';

class HomeList extends StatelessWidget {
  const HomeList(this.controller, {Key? key}) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: controller.lists.length,
      padding: EdgeInsets.zero,
      separatorBuilder: (_, __) => const SizedBox(height: kListSpacing),
      itemBuilder: (_, index) {
        return ListCard(
          controller.lists[index],
          controller.openListPage,
        );
      },
    );
  }
}

class MoviesList extends StatelessWidget {
  const MoviesList({
    Key? key,
    required this.loading,
    required this.itemCount,
    required this.movies,
    required this.onTap,
    required this.scrollController,
  }) : super(key: key);

  final bool loading;
  final int itemCount;
  final List<MovieEntity> movies;
  final Function onTap;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GridView.builder(
          controller: scrollController,
          padding: kAppPagePadding,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: kListSpacing,
            childAspectRatio: 0.6656,
          ),
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: itemCount,
          itemBuilder: (_, index) {
            return MovieCard(movies[index], onTap);
          },
        ),
        Visibility(
          visible: loading,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: kVerticalPadding),
              child: CircularProgressIndicator(color: Theme.of(context).primaryColor),
            ),
          ),
        ),
      ],
    );
  }
}
