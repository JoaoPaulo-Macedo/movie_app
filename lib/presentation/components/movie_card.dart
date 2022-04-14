import 'package:flutter/material.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';

import '../pages/movie_details_page.dart';
import 'movie_poster.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({Key? key, required this.movie}) : super(key: key);

  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        height: 140,
        decoration: BoxDecoration(color: Theme.of(context).primaryColor),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MovieDetailsPage(movie),
                  fullscreenDialog: true,
                ),
              );
            },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MoviePoster(movieId: movie.id, posterPath: movie.posterPath),
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
          ),
        ),
      ),
    );
  }
}
