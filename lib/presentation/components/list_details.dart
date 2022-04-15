import 'package:flutter/material.dart';
import 'package:movie_app/domain/entities/created_by_entity.dart';
import 'package:movie_app/domain/entities/movies_list_entity.dart';
import 'package:movie_app/presentation/components/pagination.dart';
import 'package:movie_app/presentation/controllers/home_controller.dart';

class ListDetails extends StatelessWidget {
  const ListDetails({
    Key? key,
    required this.controller,
    required this.function,
  }) : super(key: key);

  final HomeController controller;
  final void Function() function;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    MoviesListEntity moviesList = controller.moviesList as MoviesListEntity;
    const horizontalPadding = 5.0;

    return Column(
      children: [
        Center(
          child: Text(
            moviesList.name,
            style: textTheme.headline5?.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: Column(
            children: [
              Text(moviesList.description, style: textTheme.subtitle1),
              const SizedBox(height: 5),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'List created by ${moviesList.createdBy.name}',
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
