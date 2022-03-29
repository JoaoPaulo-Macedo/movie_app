import 'package:flutter/material.dart';

import '../utils/api_utils.dart';

class MoviePoster extends StatelessWidget {
  const MoviePoster({Key? key, required this.posterPath, this.radius = 15})
      : super(key: key);

  final String posterPath;
  final double radius;

  @override
  Widget build(BuildContext context) {
    const double posterWidth = 93.5;

    return ClipRRect(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(radius),
        bottomLeft: Radius.circular(radius),
      ),
      child: Image.network(
        API.requestImg(posterPath),
        width: posterWidth,
        loadingBuilder: (_, child, progress) {
          if (progress == null) return child;

          return const SizedBox(
            width: posterWidth,
            child: Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
          );
        },
      ),
    );
  }
}
