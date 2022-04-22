import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_app/app/domain/entities/favorite_movies_list_entity.dart';
import 'package:movie_app/app/domain/entities/movie_entity.dart';
import 'package:movie_app/app/domain/entities/movies_list_entity.dart';
import 'package:movie_app/app/domain/usecases/favorite_movies_list_usecase.dart';
import 'package:movie_app/app/domain/usecases/get_movies_list_usecase.dart';
import 'package:movie_app/app/presentation/dtos/movies_list_dto.dart';
import 'package:movie_app/app/presentation/pages/movie/movie_page.dart';

part 'list_controller.g.dart';

class ListController = _ListController with _$ListController;

abstract class _ListController with Store {
  _ListController(
    this._moviesUseCase,
    this._favoritesUseCase, {
    required this.listId,
  }) {
    _init();
  }

  final GetMoviesListUseCase _moviesUseCase;
  final FavoriteMoviesListUseCase _favoritesUseCase;

  @observable
  MoviesListEntity? moviesList;
  @observable
  Map<int, List<MovieEntity>>? _cachedMovies;

  FavoriteMoviesListEntity? _favoriteMovies;

  // @computed
  // bool get valid => isLoading && isSearching;

  @observable
  int listId;
  @observable
  int page = 1;

  @observable
  bool isLoading = false;
  @observable
  bool isSearching = false;
  @observable
  FocusNode searchFocus = FocusNode();
  @observable
  TextEditingController textController = TextEditingController();

  _init() async {
    isLoading = true;

    moviesList = await _moviesUseCase(list: listId, page: page);
    _cachedMovies = {page: moviesList!.movies};

    _favoriteMovies = await _favoritesUseCase.getMovies();

    isLoading = false;
  }

  _fetch() async {
    isLoading = true;

    if (!_cachedMovies!.keys.contains(page)) {
      moviesList = await _moviesUseCase(list: listId, page: page);

      _cachedMovies = {page: moviesList!.movies};
    } //

    else {
      moviesList = moviesList!.copyWith(movies: _cachedMovies![page]!);
    }

    if (textController.text.isNotEmpty) onSearch(textController.text);

    isLoading = false;
  }

  @action
  onSearch(String? value) {
    if (_cachedMovies == null) return;
    if (value == null) return;

    List<MovieEntity> list = _cachedMovies![page]!
        .where((e) => e.title.toLowerCase().contains(value.toLowerCase()))
        .toList();

    moviesList = moviesList!.copyWith(movies: list);
  }

  @action
  backPage() {
    if (page == 1) return;
    if (isLoading) return;

    page -= 1;

    _fetch();
  }

  @action
  advancePage() {
    if (page == moviesList!.totalPages) return;
    if (isLoading) return;

    page += 1;

    _fetch();
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
