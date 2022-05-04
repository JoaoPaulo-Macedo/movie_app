import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_app/app/domain/entities/movie_entity.dart';
import 'package:movie_app/app/domain/usecases/get_favorites_usecase.dart';
import 'package:movie_app/app/presentation/components/app_snackbar.dart';
import 'package:movie_app/app/presentation/pages/common/list_controller.dart';
import 'package:movie_app/app/presentation/pages/movie/movie_page.dart';
import 'package:movie_app/core/utils/failure.dart';

part 'favorites_controller.g.dart';

class FavoritesController = _FavoritesController with _$FavoritesController;

abstract class _FavoritesController extends ListController with Store {
  _FavoritesController(BuildContext context, this._favoriteUseCase) {
    _init(context);
  }

  final FavoriteMoviesListUseCase _favoriteUseCase;

  _init(BuildContext context) async {
    try {
      listEntity = await _favoriteUseCase.getMovies(page);

      movies = listEntity?.movies ?? [];
      cachedMovies = {page: movies};

      int totalPage = listEntity?.totalPages ?? 1;
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

  @override
  fetch(BuildContext context, {bool reload = false}) async {
    try {
      isLoading = true;

      if (!cachedMovies.keys.contains(page) || reload) {
        var list = await _favoriteUseCase.getMovies(page);

        movies = list!.movies ?? [];
        cachedMovies.addAll({page: movies});
      } //
      else {
        movies = cachedMovies[page]!;
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

    if (reload == null || reload[0]) await fetch(context, reload: true);
  }
}
