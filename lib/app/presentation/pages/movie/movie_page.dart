import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/app/domain/usecases/favorite_movies_list_usecase.dart';
import 'package:movie_app/app/presentation/components/app_poster.dart';
import 'package:movie_app/app/domain/entities/movie_entity.dart';
import 'package:movie_app/app/presentation/pages/movie/movie_controller.dart';

class MoviePage extends StatefulWidget {
  const MoviePage(this.movie, {Key? key, this.favorite = false}) : super(key: key);

  final MovieEntity movie;
  final bool favorite;

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  late MovieController controller;

  @override
  void initState() {
    super.initState();

    controller = MovieController(
      GetIt.instance.get<FavoriteMoviesListUseCase>(),
      widget.movie,
      favorite: widget.favorite,
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Stack(
      children: [
        Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: AppPoster.movie(
                  posterPath: widget.movie.posterPath,
                  movieId: widget.movie.id,
                  applyBorders: false,
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.movie.title,
                          style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          controller.movie.overview ?? '',
                          style: textTheme.caption!.copyWith(fontSize: 14, letterSpacing: 1.3),
                        ),
                        const SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(controller.movie.voteCount.toString()),
                            const SizedBox(width: 15),
                            Text(controller.movie.voteAverage.toString()),
                            const Icon(Icons.star, size: 15),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SafeArea(
          child: Material(
            color: Colors.transparent,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 50,
              decoration: const BoxDecoration(color: Colors.black26),
              child: Observer(
                builder: (context) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.close),
                        iconSize: 30,
                        tooltip: 'Close',
                        onPressed: () => controller.onClose(context),
                      ),
                      IconButton(
                        icon: Icon(
                          controller.favorite ? Icons.favorite : Icons.favorite_border,
                        ),
                        iconSize: 30,
                        tooltip: 'Favorite',
                        onPressed: controller.togglefavorite,
                      ),
                    ],
                  );
                }
              ),
            ),
          ),
        ),
        /* Observer(
          builder: (context) {
            return SafeArea(
              child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  elevation: 0,
                  backgroundColor: Colors.black26,
                  leading: IconButton(
                    icon: const Icon(Icons.close),
                    padding: const EdgeInsets.only(left: 5),
                    iconSize: 30,
                    tooltip: 'Close',
                    onPressed: () => controller.onClose(context),
                  ),
                  actions: [
                    IconButton(
                      icon: Icon(
                        controller.favorite ? Icons.favorite : Icons.favorite_border,
                      ),
                      iconSize: 30,
                      padding: const EdgeInsets.only(right: 15),
                      tooltip: 'Favorite',
                      onPressed: controller.togglefavorite,
                    ),
                  ],
                ),
                /* body: Column(
                children: [
                  Text(
                    movie.title,
                    style: textTheme.headline5?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ), */
              ),
            );
          },
        ), */
      ],
    );
  }
}
