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
    // final textTheme = Theme.of(context).textTheme;

    return Stack(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: AppPoster.movie(
            posterPath: widget.movie.posterPath,
            movieId: widget.movie.id,
          ),
        ),
        Observer(builder: (context) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.black38,
              leading: IconButton(
                icon: const Icon(Icons.close),
                iconSize: 25,
                tooltip: 'Close',
                onPressed: () => controller.onClose(context),
              ),
              actions: [
                IconButton(
                  icon: Icon(
                    controller.favorite ? Icons.favorite : Icons.favorite_border,
                    size: 25,
                  ),
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
          );
        }),
      ],
    );
  }
}
