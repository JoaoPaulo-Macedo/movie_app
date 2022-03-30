import 'package:flutter/cupertino.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/models/movies_list.dart';
import 'package:movie_app/repositories/movies_repository.dart';

class HomeController {
  HomeController(this._moviesRepository) {
    fetch();
  }

  final MoviesRepository _moviesRepository;

  var moviesList = ValueNotifier<MoviesList?>(null);
  MoviesList? _cachedMoviesList;

  fetch() async {
    moviesList.value = await _moviesRepository.getMovies();
    _cachedMoviesList = moviesList.value;
    await Future.delayed(const Duration(seconds: 3));
  }

  onChanged(String value) {
    if (_cachedMoviesList == null) return;

    List<Movie> list = _cachedMoviesList!.movies
        .where((e) => e.title.toLowerCase().contains(value.toLowerCase()))
        .toList();

    moviesList.value = moviesList.value!.copyWith(movies: list);
  }
}
