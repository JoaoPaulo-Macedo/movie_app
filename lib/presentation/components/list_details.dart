import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:movie_app/domain/entities/movies_list_entity.dart';
import 'package:movie_app/presentation/components/pagination.dart';
import 'package:movie_app/presentation/pages/list/list_controller.dart';

class ListDetails extends StatelessWidget {
  const ListDetails({
    Key? key,
    required this.controller,
    required this.function,
  }) : super(key: key);

  final ListController controller;
  final void Function() function;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    MoviesListEntity moviesList = controller.moviesList as MoviesListEntity;
    const horizontalPadding = 5.0;

    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  moviesList.name,
                  style: textTheme.headline5?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Observer(
              builder: (_) {
                return InkWell(
                  borderRadius: BorderRadius.circular(100),
                  child: controller.favorite
                      ? const Icon(Icons.star, size: 20, color: Colors.yellow)
                      : const Icon(Icons.star_border, size: 20),
                  onTap: () => controller.toggleFavorite(),
                );
              },
            ),
          ],
        ),
        if (moviesList.description != null && moviesList.createdBy?.name != null)
          Padding(
            padding: const EdgeInsets.fromLTRB(
              horizontalPadding,
              7.5,
              horizontalPadding,
              7.5,
            ),
            child: Column(
              children: [
                if (moviesList.description != null)
                  Text(moviesList.description!, style: textTheme.subtitle1),
                if (moviesList.description != null) const SizedBox(height: 5),
                if (moviesList.createdBy?.name != null)
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'List created by ${moviesList.createdBy!.name}',
                      style: textTheme.caption,
                    ),
                  ),
              ],
            ),
          ),
        const SizedBox(height: 15),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Movies',
              style: textTheme.headline6,
            ),
            Pagination(
              page: controller.page,
              totalPages: moviesList.totalPages,
              backPage: controller.backPage,
              advancePage: controller.advancePage,
            )
          ],
        ),
      ],
    );
  }
}
