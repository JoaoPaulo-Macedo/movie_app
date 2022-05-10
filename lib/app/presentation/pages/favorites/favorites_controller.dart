import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_app/app/domain/entities/movie_entity.dart';
import 'package:movie_app/app/domain/usecases/get_favorites_usecase.dart';
import 'package:movie_app/app/presentation/pages/common/list_controller.dart';
import 'package:movie_app/app/presentation/pages/movie/movie_page.dart';
import 'package:movie_app/core/utils/failure.dart';

part 'favorites_controller.g.dart';

class FavoritesController = _FavoritesController with _$FavoritesController;

abstract class _FavoritesController extends ListController with Store {
  _FavoritesController(this._getFavoritesUseCase, {required this.snackBar}) {
    init();
  }

  final GetFavoritesUseCase _getFavoritesUseCase;
  final Function(Failure e) snackBar;

  @override
  init() async {
    isLoading = true;

    try {
      listEntity = await _getFavoritesUseCase();

      addMovies(listEntity?.movies);
      cachedMovies = movies;

      isLoading = false;
    } on Failure catch (f) {
      _onFailure(f);
    }
  }

  @override
  fetchMovies({bool reload = false}) async {
    try {
      var list = await _getFavoritesUseCase();

      return list?.movies;
    } on Failure catch (f) {
      _onFailure(f);

      return null;
    }
  }

  @override
  @action
  openMoviePage(BuildContext context, MovieEntity movie) async {
    List? reload = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => MoviePage(movie),
        fullscreenDialog: true,
      ),
    );

    if (reload == null || reload[0]) {
      var list = await fetchMovies(reload: true);
      movies = list ?? [];
    }
  }

  _onFailure(Failure f) {
    snackBar(f);

    isLoading = false;
  }
}
