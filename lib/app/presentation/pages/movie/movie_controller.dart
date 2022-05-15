import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_app/app/domain/entities/movie_entity.dart';
import 'package:movie_app/app/domain/usecases/get_favorites_usecase.dart';
import 'package:movie_app/app/domain/usecases/remove_favorite_usecase.dart';
import 'package:movie_app/app/domain/usecases/save_favorite_usecase.dart';
import 'package:movie_app/core/utils/failure.dart';

part 'movie_controller.g.dart';

class MovieController = _MovieController with _$MovieController;

abstract class _MovieController with Store {
  _MovieController(
    this._getFavoritesUseCase,
    this._saveFavoriteUseCase,
    this._removeFavoriteUseCase, {
    required this.movie,
  }) {
    _init();
  }

  final GetFavoritesUseCase _getFavoritesUseCase;
  final SaveFavoriteUseCase _saveFavoriteUseCase;
  final RemoveFavoriteUseCase _removeFavoriteUseCase;
  final MovieEntity movie;

  @observable
  bool isFavorite = false;
  @observable
  bool isLoading = true;
  @observable
  int page = 1;
  @observable
  double offset = 0;
  @observable
  Failure? error;
  @observable
  bool close = false;

  bool _canClose = true;
  bool _closeRequest = false;

  bool? _isFavoriteCache;
  ScrollController scrollController = ScrollController();

  @action
  _init() async {
    try {
      var favorites = await _getFavoritesUseCase();

      isFavorite = favorites!.movies!.any((e) => e.id == movie.id);

      _isFavoriteCache = isFavorite;

      scrollController.addListener(() {
        double controllerOffset = scrollController.offset;

        if (controllerOffset < 0) return;

        offset = controllerOffset;
      });

      isLoading = false;
    } on Failure catch (f) {
      isLoading = false;
      error = f;
    }
  }

  @action
  togglefavorite() async {
    if (isLoading == true) return;

    isLoading = true;
    _canClose = false;

    if (!isFavorite) {
      isFavorite = !isFavorite;
      await _saveFavoriteUseCase(movie, page);
    } else {
      isFavorite = !isFavorite;
      await _removeFavoriteUseCase(movie, page);
    }

    _canClose = true;
    isLoading = false;

    if (_closeRequest) close = true;
  }

  void requestClose() {
    if (_canClose) close = true;

    _closeRequest = true;
  }

  bool favoriteChanged() {
    return _isFavoriteCache != isFavorite;
  }
}
