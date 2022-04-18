import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/api_utils.dart';

class AppPoster extends StatelessWidget {
  const AppPoster._({
    Key? key,
    this.posterPath,
    this.movieId,
  }) : super(key: key);

  factory AppPoster.list(String? posterPath) => AppPoster._(posterPath: posterPath);
  factory AppPoster.movie({required String? posterPath, required int movieId}) {
    return AppPoster._(
      posterPath: posterPath,
      movieId: movieId,
    );
  }

  final Object? movieId;
  final String? posterPath;

  @override
  Widget build(BuildContext context) {
    const double posterWidth = 93.5;

    return Hero(
      tag: movieId ?? Object(),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          bottomLeft: Radius.circular(15),
        ),
        child: Image.network(
          API.requestImg(posterPath ?? ''),
          width: posterWidth,
          errorBuilder: (_, __, ___) {
            return const SizedBox(
              width: posterWidth,
              child: Center(
                child: Icon(Icons.error_outline, color: Colors.red, size: 40),
              ),
            );
          },
          loadingBuilder: (_, child, progress) {
            if (progress == null) return child;

            return const SizedBox(
              width: posterWidth,
              child: Center(
                child: CircularProgressIndicator(color: Colors.white),
              ),
            );
          },
        ),
      ),
    );
  }
}
