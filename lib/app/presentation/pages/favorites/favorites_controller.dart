import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_app/app/domain/entities/favorite_movies_list_entity.dart';
import 'package:movie_app/app/domain/entities/movie_entity.dart';
import 'package:movie_app/app/domain/usecases/get_favorite_movies_list_usecase.dart';
import 'package:movie_app/app/presentation/dtos/favorite_movies_list_dto.dart';
import 'package:movie_app/app/presentation/pages/movie/movie_details_page.dart';

part 'favorites_controller.g.dart';

class FavoritesController = _FavoritesController with _$FavoritesController;

// TODO: make favorites and home controller one
abstract class _FavoritesController with Store {
  _FavoritesController(this._useCase) {
    fetch();
  }

  final GetFavoriteMoviesListUseCase _useCase;

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

  fetch() async {
    isLoading = true;

    if (_cachedMovies.isEmpty || !_cachedMovies.keys.contains(page)) {
      moviesList = await _useCase(page);
      _cachedMovies[page] = moviesList!.movies;
    } else {
      moviesList = moviesList!.copyWith(movies: _cachedMovies[page]!);
    }

    if (textController.text.isNotEmpty) onSearch(textController.text);

    isLoading = false;
  }

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
  backPage() {
    if (page == 1) return;
    if (isLoading) return;

    page -= 1;

    fetch();
  }

  @action
  advancePage() {
    if (page == moviesList!.totalPages) return;
    if (isLoading) return;

    page += 1;

    fetch();
  }

  @action
  openMoviePage(BuildContext context, MovieEntity movie) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => MovieDetailsPage(movie),
        fullscreenDialog: true,
      ),
    );
  }
}
