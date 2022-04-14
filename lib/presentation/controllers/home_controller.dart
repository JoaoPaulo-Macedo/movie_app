import 'package:flutter/cupertino.dart';
import 'package:movie_app/domain/entities/movie.dart';
import 'package:movie_app/domain/entities/movies_list.dart';
import 'package:movie_app/presentation/dtos/movies_list_dto.dart';
import 'package:movie_app/domain/usecases/get_movies_usecase.dart';

class HomeController {
  HomeController(this._getMoviesUseCase) {
    fetch();
  }

  final GetMoviesUseCase _getMoviesUseCase;

  var moviesList = ValueNotifier<MoviesListEntity?>(null);
  MoviesListEntity? _cachedMoviesList;

  fetch() async {
    try {
      moviesList.value = await _getMoviesUseCase();
      _cachedMoviesList = moviesList.value;
      await Future.delayed(const Duration(seconds: 3));
    } catch (e) {
      rethrow;
    }
  }

  onChanged(String value) {
    if (_cachedMoviesList == null) return;

    List<MovieEntity> list = _cachedMoviesList!.movies
        .where((e) => e.title.toLowerCase().contains(value.toLowerCase()))
        .toList();

    moviesList.value = moviesList.value!.copyWith(movies: list);
  }
}
