import 'package:flutter/material.dart';
import 'package:movie_app/models/movies.dart';

import '../utils/api_utils.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({required this.index, required this.movie});

  final int index;
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      padding: const EdgeInsets.all(5),
      color: index % 2 != 0
          ? const Color.fromARGB(255, 5, 5, 5)
          : const Color.fromARGB(255, 12, 12, 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            API.requestImg(movie.posterPath),
            width: 80,
            height: 120,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;

              return const SizedBox(
                width: 80,
                child: Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              );
            },
          ),
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
