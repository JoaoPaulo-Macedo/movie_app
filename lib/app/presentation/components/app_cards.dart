import 'package:flutter/material.dart';
import 'package:movie_app/app/domain/entities/movie_entity.dart';
import 'package:movie_app/app/domain/entities/movies_list_entity.dart';
import 'package:movie_app/app/presentation/components/app_poster.dart';
import 'package:movie_app/app/presentation/app_styles.dart';
import 'package:movie_app/app/presentation/consts.dart';
import 'package:movie_app/app/presentation/pages/favorites/favorites_controller.dart';
import 'package:movie_app/app/presentation/pages/list_page/list_controller.dart';
import 'package:movie_app/app/presentation/pages/movie/movie_page.dart';
import 'package:movie_app/app/presentation/pages/movies_list/movies_list_page.dart';

class ListCard extends StatelessWidget {
  const ListCard(this.list, {Key? key}) : super(key: key);

  final ListEntity list;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(kCardBorderRadius),
      child: Container(
        height: 140,
        decoration: BoxDecoration(color: Theme.of(context).cardColor),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return MoviesListPage(listId: list.id);
              }));
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppPoster.list(list.posterPath ?? ''),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          list.name,
                          maxLines: 3,
                          style: AppTextStyles.of(context).listName,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                Text(
                                  list.averageRating?.toStringAsFixed(2) ?? '',
                                  style: const TextStyle(fontSize: 11),
                                ),
                                const SizedBox(width: 3),
                                const Icon(Icons.star, size: 10),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MovieCard extends StatelessWidget {
  const MovieCard(this.movie, this.controller, {Key? key}) : super(key: key);

  final MovieEntity movie;
  final ListController controller;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(kCardBorderRadius),
      child: Stack(
        children: [
          Positioned.fill(
            child: AppPoster.movie(movieId: movie.id, posterPath: movie.posterPath),
          ),
          Positioned.fill(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => onTap(context),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onTap(BuildContext context) async {
    if (controller is FavoritesController) {
      List? reload = await Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => MoviePage(movie), fullscreenDialog: true),
      );

      if (reload == null || reload[0]) {
        var list = await (controller as FavoritesController).fetchMovies(reload: true);
        controller.movies = list ?? [];
      }
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => MoviePage(movie), fullscreenDialog: true),
      );
    }
  }
}
