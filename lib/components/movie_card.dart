import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';

import 'movie_poster.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({Key? key, required this.movie}) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    const radius = 15.0;

    return Container(
      height: 140,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 25, 25, 25),
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MoviePoster(posterPath: movie.posterPath, radius: radius),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: textTheme.headline6,
                    overflow: TextOverflow.clip,
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Center(
                        child: Text(
                          movie.voteCount.toString(),
                          style: const TextStyle(fontSize: 10),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        movie.voteAverage.toString(),
                      ),
                      const Icon(Icons.star, size: 13),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
