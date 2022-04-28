import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_app/app/domain/entities/favorite_movies_list_entity.dart';
import 'package:movie_app/app/domain/entities/movie_entity.dart';
import 'package:movie_app/app/domain/usecases/favorite_movies_list_usecase.dart';
import 'package:movie_app/app/presentation/components/app_snackbar.dart';
import 'package:movie_app/app/presentation/dtos/favorite_movies_list_dto.dart';
import 'package:movie_app/app/presentation/pages/common/list_controller.dart';
import 'package:movie_app/app/presentation/pages/movie/movie_page.dart';
import 'package:movie_app/core/utils/failure.dart';

part 'favorites_controller.g.dart';

class FavoritesController = _FavoritesController with _$FavoritesController;

abstract class _FavoritesController extends ListController with Store {
  _FavoritesController(BuildContext context, this._useCase) {
    _init(context);
  }

  final FavoriteMoviesListUseCase _useCase;

  @observable
  FavoriteMoviesListEntity? moviesList;

  _init(BuildContext context) async {
    try {
      moviesList = await _useCase.getMovies(page);

      movies = moviesList?.movies ?? [];
      cachedMovies = {page: moviesList!.movies};

      int totalPage = moviesList?.totalPages ?? 1;
      isPaginated = totalPage > 1;

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

  _fetch(BuildContext context) async {
    try {
      isLoading = true;

      if (!cachedMovies.keys.contains(page)) {
        var list = await _useCase.getMovies(page);

        movies = list!.movies;
        cachedMovies.addAll({page: movies});
      } //
      else {
        var list = moviesList!.copyWith(movies: cachedMovies[page]!);

        movies = list.movies;
      }

      if (textController.text.isNotEmpty) onSearch(textController.text);

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

  @override
  @action
  onSearch(String? value) {
    if (cachedMovies.isEmpty) return;

    if (value == null) {
      textController.clear();
      isSearching = false;

      movies = cachedMovies[page]!;

      return;
    }

    List<MovieEntity> searchList = cachedMovies[page]!
        .where((e) => e.title.toLowerCase().contains(value.toLowerCase()))
        .toList();

    var list = moviesList!.copyWith(movies: searchList);

    movies = list.movies;
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

    if (reload == null || reload[0]) await _fetch(context);
  }
}
