import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:movie_app/app/domain/entities/movie_entity.dart';
import 'package:movie_app/app/presentation/components/app_cards.dart';
import 'package:movie_app/app/presentation/consts.dart';
import 'package:movie_app/app/presentation/pages/home/home_controller.dart';
import 'package:movie_app/app/presentation/pages/list_page/list_controller.dart';

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
        return ListCard(controller.lists[index]);
      },
    );
  }
}

class MoviesList extends StatelessWidget {
  const MoviesList(this.controller, {Key? key}) : super(key: key);

  final ListController controller;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Stack(
          children: [
            GridView.builder(
              controller: controller.scrollController,
              padding: kAppPagePadding,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: kListSpacing,
                childAspectRatio: 0.6656,
              ),
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: controller.movies.length,
              itemBuilder: (_, index) {
                return MovieCard(controller.movies[index], controller);
              },
            ),
            Visibility(
              visible: controller.isLoading,
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
      },
    );
  }
}
