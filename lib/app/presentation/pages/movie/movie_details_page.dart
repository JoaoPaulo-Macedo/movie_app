import 'package:flutter/material.dart';
import 'package:movie_app/app/presentation/components/app_poster.dart';
import 'package:movie_app/core/utils/api_utils.dart';
import 'package:movie_app/app/domain/entities/movie_entity.dart';

class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage(this.movie, {Key? key}) : super(key: key);

  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Stack(
      children: [
        SizedBox(
          // height: MediaQuery.of(context).size.height * .55,
          width: MediaQuery.of(context).size.width,
          child: AppPoster.movie(
            posterPath: movie.posterPath,
            movieId: movie.id,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            leading: InkWell(
              child: const Icon(Icons.close, size: 30),
              onTap: () => Navigator.pop(context),
            ),
          ),
          /* body: Column(
            children: [
              Text(
                movie.title,
                style: textTheme.headline5?.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ), */
        ),
      ],
    );
  }
}
