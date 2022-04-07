import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/api_utils.dart';

class MoviePoster extends StatelessWidget {
  const MoviePoster({Key? key, required this.movieId, required this.posterPath})
      : super(key: key);

  final int movieId;
  final String posterPath;

  @override
  Widget build(BuildContext context) {
    const double posterWidth = 93.5;

    return Hero(
      tag: movieId,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          bottomLeft: Radius.circular(15),
        ),
        child: Image.network(
          API.requestImg(posterPath),
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
