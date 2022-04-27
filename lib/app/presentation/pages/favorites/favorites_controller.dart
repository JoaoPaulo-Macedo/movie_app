import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_app/app/domain/entities/favorite_movies_list_entity.dart';
import 'package:movie_app/app/domain/entities/movie_entity.dart';
import 'package:movie_app/app/domain/usecases/favorite_movies_list_usecase.dart';
import 'package:movie_app/app/presentation/components/app_snackbar.dart';
import 'package:movie_app/app/presentation/dtos/favorite_movies_list_dto.dart';
import 'package:movie_app/app/presentation/pages/movie/movie_page.dart';
import 'package:movie_app/core/utils/failure.dart';

part 'favorites_controller.g.dart';

class FavoritesController = _FavoritesController with _$FavoritesController;

// TODO: make favorites and home controller one
abstract class _FavoritesController with Store {
  _FavoritesController(BuildContext context, this._favoriteUseCase) {
    _fetch(context);
  }

  final FavoriteMoviesListUseCase _favoriteUseCase;

  @observable
  FavoriteMoviesListEntity? moviesList;
  @observable
  // ignore: prefer_final_fields
  Map<int, List<MovieEntity>> _cachedMovies = {};
  @observable
  int page = 1;

  @observable
  bool isLoading = true;
  @observable
  bool isSearching = false;
  @observable
  FocusNode searchFocus = FocusNode();
  @observable
  TextEditingController textController = TextEditingController();

  _fetch(BuildContext context) async {
    if (_cachedMovies.isEmpty || !_cachedMovies.keys.contains(page)) {
      await _loadList(context);
    } else {
      moviesList = moviesList!.copyWith(movies: _cachedMovies[page]!);
    }

    if (textController.text.isNotEmpty) onSearch(textController.text);
  }

  _loadList(BuildContext context) async {
    try {
      isLoading = true;

      moviesList = await _favoriteUseCase.getMovies(page);
      _cachedMovies[page] = moviesList!.movies;

      isLoading = false;
    } on Failure catch (e) {
      //TODO: Should the controller call a ui widget?
      AppSnackBar.show(
        context,
        message: e.message,
        description: e.description,
        type: AppSnackBarType.error,
      );

      isLoading = false;
    }
  }

  @action
  bool isListEmpty() => moviesList?.movies == null || moviesList!.movies.isEmpty;

  @action
  onSearch(String? value) {
    if (_cachedMovies.isEmpty) return;
    if (value == null) return;

    List<MovieEntity> list = _cachedMovies[page]!
        .where((e) => e.title.toLowerCase().contains(value.toLowerCase()))
        .toList();

    moviesList = moviesList!.copyWith(movies: list);
  }

  @action
  backPage(BuildContext context) {
    if (page == 1) return;
    if (isLoading) return;

    page -= 1;

    _fetch(context);
  }

  @action
  advancePage(BuildContext context) {
    if (page == moviesList!.totalPages) return;
    if (isLoading) return;

    page += 1;

    _fetch(context);
  }

  @action
  openMoviePage(BuildContext context, MovieEntity movie) async {
    List? reload = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => MoviePage(movie, favorite: true),
        fullscreenDialog: true,
      ),
    );

    if (reload == null || reload[0]) await _loadList(context);
  }
}
