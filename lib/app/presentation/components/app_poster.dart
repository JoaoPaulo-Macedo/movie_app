import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/api_utils.dart';

class AppPoster extends StatelessWidget {
  const AppPoster._({
    Key? key,
    required this.posterPath,
    required this.applyBorders,
    this.movieId,
  }) : super(key: key);

  factory AppPoster.list(String posterPath, {bool applyBorders = true}) {
    return AppPoster._(
      posterPath: posterPath,
      applyBorders: applyBorders,
    );
  }
  
  factory AppPoster.movie({
    required String? posterPath,
    required int movieId,
    bool applyBorders = true,
  }) {
    return AppPoster._(
      posterPath: posterPath,
      movieId: movieId,
      applyBorders: applyBorders,
    );
  }

  final Object? movieId;
  final String? posterPath;
  final bool applyBorders;

  @override
  Widget build(BuildContext context) {
    const double posterWidth = 93.5;

    return Hero(
      tag: movieId ?? Object(),
      child: ClipRRect(
        borderRadius: applyBorders
            ? const BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              )
            : BorderRadius.zero,
        child: CachedNetworkImage(
          imageUrl: API.requestImg(posterPath ?? ''),
          width: posterWidth,
          placeholder: (_, __) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.white),
            );
          },
          errorWidget: (_, __, ___) {
            return const SizedBox(
              width: posterWidth,
              child: Center(
                child: Icon(Icons.error_outline, size: 40),
              ),
            );
          },
        ),
      ),
    );
  }
}
