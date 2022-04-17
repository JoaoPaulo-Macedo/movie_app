import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/domain/entities/movies_list_entity.dart';
import 'package:movie_app/domain/usecases/favorite_movies_list_usecase.dart';
import 'package:movie_app/domain/usecases/get_movies_from_list_usecase.dart';
import 'package:movie_app/presentation/dtos/movies_list_dto.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  _HomeController(this._getFromListUseCase, this._favoriteUseCase) {
    fetch();
  }

  final GetMoviesFromListUseCase _getFromListUseCase;
  final FavoriteMoviesListsUseCase _favoriteUseCase;

  @observable
  MoviesListEntity? moviesList;
  @observable
  MoviesListEntity? _cachedMoviesList;

  // @computed
  // bool get valid => isLoading && isSearching;

  @observable
  int listId = 1;
  @observable
  int page = 1;
  @observable
  bool favorite = false;

  @observable
  bool isLoading = false;
  @observable
  bool isSearching = false;
  @observable
  FocusNode searchFocus = FocusNode();
  @observable
  TextEditingController textController = TextEditingController();

  @action
  fetch() async {
    moviesList = await _getFromListUseCase(list: listId, page: page);
    _cachedMoviesList = moviesList;

    var favorites = await _favoriteUseCase.getFavorites();
    for (var e in favorites) {
      if (e.id == moviesList!.id) {
        favorite = true;
        print(e.id);
      }
    }

    isLoading = false;
  }

  @action
  onSearch(String value) {
    if (_cachedMoviesList == null) return;

    List<MovieEntity> list = _cachedMoviesList!.movies
        .where((e) => e.title.toLowerCase().contains(value.toLowerCase()))
        .toList();

    moviesList = moviesList!.copyWith(movies: list);
  }

  @action
  backPage() {
    if (page == 1) return;
    if (isLoading) return;

    isLoading = true;
    page -= 1;

    fetch();
  }

  @action
  advancePage() {
    if (page == moviesList!.totalPages) return;
    if (isLoading) return;

    isLoading = true;
    page += 1;

    fetch();
  }

  @action
  toggleFavorite() {
    if (favorite) {
      _favoriteUseCase.removeFavorite(listId);
      favorite = false;
    } else {
      _favoriteUseCase.addFavorite(listId, moviesList!.name);
      favorite = true;
    }
  }
}
