import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';

import 'movie_poster.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({Key? key, required this.movie}) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    double radius = 15;

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
              padding: const EdgeInsets.fromLTRB(10, 5, 5, 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    style: const TextStyle(fontSize: 17),
                    overflow: TextOverflow.clip,
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      const SizedBox(),
                      const Spacer(),
                      Text(
                        movie.voteCount.toString(),
                        style: const TextStyle(fontSize: 10),
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
