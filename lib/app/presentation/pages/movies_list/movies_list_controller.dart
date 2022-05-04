import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_app/app/domain/entities/movie_entity.dart';
import 'package:movie_app/app/domain/usecases/get_list_usecase.dart';
import 'package:movie_app/app/presentation/components/app_snackbar.dart';
import 'package:movie_app/app/presentation/pages/common/list_controller.dart';
import 'package:movie_app/app/presentation/pages/movie/movie_page.dart';
import 'package:movie_app/core/utils/failure.dart';

part 'movies_list_controller.g.dart';

class MoviesListController = _MoviesListController with _$MoviesListController;

abstract class _MoviesListController extends ListController with Store {
  _MoviesListController(BuildContext context, this._moviesUseCase, {required this.listId}) {
    _init(context);
  }

  final GetMoviesListUseCase _moviesUseCase;

  @observable
  int listId;

  _init(BuildContext context) async {
    try {
      listEntity = await _moviesUseCase(list: listId, page: page);

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
  fetch(BuildContext context) async {
    try {
      isLoading = true;

      if (!cachedMovies.keys.contains(page)) {
        var list = await _moviesUseCase(list: listId, page: page);

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
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => MoviePage(movie),
        fullscreenDialog: true,
      ),
    );
  }
}
