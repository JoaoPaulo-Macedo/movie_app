import 'package:flutter/cupertino.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/domain/entities/movies_list_entity.dart';
import 'package:movie_app/presentation/dtos/movies_list_dto.dart';
import 'package:movie_app/domain/usecases/get_movies_from_list_usecase.dart';

class HomeControllerChangeNotifier {
  HomeControllerChangeNotifier(this._getFromListUseCase) {
    fetch();
  }

  final GetMoviesFromListUseCase _getFromListUseCase;

  final moviesList = ValueNotifier<MoviesListEntity?>(null);
  MoviesListEntity? _cachedMoviesList;
  bool isLoading = false;
  int list = 1;
  int page = 1;

  void fetch() async {
    isLoading = true;
    moviesList.notifyListeners();

    try {
      await Future.delayed(const Duration(seconds: 3));
      moviesList.value = await _getFromListUseCase(list: list, page: page);
      _cachedMoviesList = moviesList.value;
      isLoading = false;
      moviesList.notifyListeners();
    } catch (e) {
      rethrow;
    }
  }

  void onChanged(String value) {
    if (_cachedMoviesList == null) return;

    List<MovieEntity> list = _cachedMoviesList!.movies
        .where((e) => e.title.toLowerCase().contains(value.toLowerCase()))
        .toList();

    moviesList.value = moviesList.value!.copyWith(movies: list);
  }

  void backPage() {
    if (page == 1) return;

    page -= 1;

    fetch();
  }

  void advancePage() {
    if (page == moviesList.value!.totalPages) return;

    page += 1;

    fetch();
  }
}
