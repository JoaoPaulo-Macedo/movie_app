import 'package:flutter/material.dart';
import 'package:movie_app/app/domain/entities/movie_entity.dart';
import 'package:movie_app/app/presentation/components/app_poster.dart';

class MoviePoster extends StatelessWidget {
  const MoviePoster(this.movie, {Key? key}) : super(key: key);

  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      foregroundDecoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.black12,
            Colors.black12,
            Colors.black38,
            Theme.of(context).scaffoldBackgroundColor,
          ],
        ),
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: AppPoster.movie(
          posterPath: movie.posterPath,
          movieId: movie.id,
        ),
      ),
    );
  }
}
