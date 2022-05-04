import 'package:flutter/material.dart';
import 'package:movie_app/app/domain/entities/movie_entity.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails(this.movie, {Key? key}) : super(key: key);

  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final primaryColor = Theme.of(context).primaryColor;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          movie.title,
          style: textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 5),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text('${movie.voteCount.toString()} votes', style: const TextStyle(fontSize: 9)),
            const SizedBox(width: 10),
            Row(
              children: [
                Text(
                  movie.voteAverage.toString(),
                  style: TextStyle(fontSize: 11, color: primaryColor),
                ),
                Icon(Icons.star, size: 10, color: primaryColor),
              ],
            ),
          ],
        ),
        const SizedBox(height: 35),
        Text(
          movie.overview ?? '',
          style: textTheme.caption!.copyWith(fontSize: 14, letterSpacing: 0.5),
          overflow: TextOverflow.visible,
        ),
      ],
    );
  }
}
