import 'package:flutter/material.dart';
import 'package:movie_app/app/domain/entities/movie_entity.dart';
import 'package:movie_app/app/presentation/pages/theme.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails(this.movie, {Key? key}) : super(key: key);

  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    final theme = AppTextStyles.of(context);
    final primaryColor = Theme.of(context).primaryColor;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          movie.title,
          style: theme.movieName,
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
          style: theme.caption!.copyWith(fontSize: 14, letterSpacing: 0.5),
          overflow: TextOverflow.visible,
        ),
      ],
    );
  }
}
