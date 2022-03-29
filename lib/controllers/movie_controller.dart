import 'package:flutter/cupertino.dart';
import 'package:movie_app/models/movies_list.dart';
import 'package:movie_app/repositories/movies_repository.dart';

class MovieController {
  MovieController(this._moviesRepository) {
    fetch();
  }

  final MoviesRepository _moviesRepository;

  var movieList = ValueNotifier<MoviesList?>(null);

  fetch() async {
    var movies = await _moviesRepository.getMovies();
    await Future.delayed(const Duration(seconds: 3));
    movieList.value = movies;
  }
}
