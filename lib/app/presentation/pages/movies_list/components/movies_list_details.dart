import 'package:flutter/material.dart';
import 'package:movie_app/app/domain/entities/movies_list_entity.dart';
import 'package:movie_app/app/presentation/components/pagination.dart';
import 'package:movie_app/app/presentation/pages/movies_list/movies_list_controller.dart';

class MoviesListDetails extends StatelessWidget {
  const MoviesListDetails({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final MoviesListController controller;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    ListEntity? moviesList = controller.listEntity;
    const horizontalPadding = 5.0;

    if (moviesList == null) return const SizedBox();

    return Column(
      children: [
        Text(
          moviesList.name,
          style: textTheme.headline5?.copyWith(fontWeight: FontWeight.bold),
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
                Text(moviesList.description!, style: textTheme.subtitle1),
                const SizedBox(height: 5),
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
            controller.isPaginated
                ? Pagination(
                    page: controller.page,
                    totalPages: controller.listEntity?.totalPages ?? 1,
                    backPage: () => controller.backPage(context),
                    advancePage: () => controller.advancePage(context),
                  )
                : const SizedBox(),
          ],
        ),
      ],
    );
  }
}
