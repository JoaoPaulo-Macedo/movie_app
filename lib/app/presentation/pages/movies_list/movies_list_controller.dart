import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_app/app/domain/entities/favorite_movies_list_entity.dart';
import 'package:movie_app/app/domain/entities/movie_entity.dart';
import 'package:movie_app/app/domain/entities/movies_list_entity.dart';
import 'package:movie_app/app/domain/usecases/favorite_movies_list_usecase.dart';
import 'package:movie_app/app/domain/usecases/get_movies_list_usecase.dart';
import 'package:movie_app/app/presentation/components/app_snackbar.dart';
import 'package:movie_app/app/presentation/dtos/movies_list_dto.dart';
import 'package:movie_app/app/presentation/pages/common/list_controller.dart';
import 'package:movie_app/app/presentation/pages/movie/movie_page.dart';
import 'package:movie_app/core/utils/failure.dart';

part 'movies_list_controller.g.dart';

class MoviesListController = _MoviesListController with _$MoviesListController;

abstract class _MoviesListController extends ListController with Store {
  _MoviesListController(
    BuildContext context,
    this._moviesUseCase,
    this._favoritesUseCase, {
    required this.listId,
  }) {
    _init(context);
  }

  final GetMoviesListUseCase _moviesUseCase;
  final FavoriteMoviesListUseCase _favoritesUseCase;

  MoviesListEntity? moviesList;
  FavoriteMoviesListEntity? _favoriteMovies;

  // @observable
  // List<MovieEntity> movies = [];
  // @observable
  // Map<int, List<MovieEntity>>? cachedMovies;

  // @computed
  // bool get valid => isLoading && isSearching;

  @observable
  int listId;
  // @observable
  // int page = 1;

  // @observable
  // bool isLoading = true;
  // @observable
  // bool isSearching = false;
  // @observable
  // FocusNode searchFocus = FocusNode();
  // @observable
  // TextEditingController textController = TextEditingController();

  _init(BuildContext context) async {
    try {
      moviesList = await _moviesUseCase(list: listId, page: page);

      movies = moviesList?.movies ?? [];
      cachedMovies = {page: moviesList!.movies};

      _favoriteMovies = await _favoritesUseCase.getMovies();

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
        var list = await _moviesUseCase(list: listId, page: page);

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
  openMoviePage(BuildContext context, MovieEntity movie) {
    bool favorite = _favoriteMovies!.movies.any((e) => e.id == movie.id);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => MoviePage(movie, favorite: favorite),
        fullscreenDialog: true,
      ),
    );
  }
}
