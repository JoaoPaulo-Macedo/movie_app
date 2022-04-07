import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/api_utils.dart';
import 'package:movie_app/features/movie/domain/entities/movie.dart';

class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage(this.movie, {Key? key}) : super(key: key);

  final MovieEntity movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie.title)),
      body: SizedBox(
        height: MediaQuery.of(context).size.height * .55,
        width: MediaQuery.of(context).size.width,
        child: Hero(
          tag: movie.id,
          child: Image.network(
            API.requestImg(movie.posterPath),
            errorBuilder: (_, __, ___) {
              return const SizedBox(
                child: Center(
                  child: Icon(Icons.error_outline, color: Colors.red, size: 40),
                ),
              );
            },
            loadingBuilder: (_, child, progress) {
              if (progress == null) return child;

              return const SizedBox(
                child: Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
