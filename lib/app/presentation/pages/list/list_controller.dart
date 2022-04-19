import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_app/app/domain/entities/movie_entity.dart';
import 'package:movie_app/app/domain/entities/movies_list_entity.dart';
import 'package:movie_app/app/domain/usecases/get_movies_list_usecase.dart';
import 'package:movie_app/app/presentation/dtos/movies_list_dto.dart';
import 'package:movie_app/app/presentation/pages/movie/movie_details_page.dart';

part 'list_controller.g.dart';

class ListController = _ListController with _$ListController;

abstract class _ListController with Store {
  _ListController(
    this._getFromListUseCase, {
    required this.listId,
  }) {
    fetch();
  }

  final GetMoviesListUseCase _getFromListUseCase;

  @observable
  MoviesListEntity? moviesList;
  @observable
  // ignore: prefer_final_fields
  Map<int, List<MovieEntity>> _cachedMovies = {};

  // @computed
  // bool get valid => isLoading && isSearching;

  @observable
  int listId;
  @observable
  int page = 1;
  @observable
  bool favorite = false;

  @observable
  bool isLoading = true;
  @observable
  bool isSearching = false;
  @observable
  FocusNode searchFocus = FocusNode();
  @observable
  TextEditingController textController = TextEditingController();

  @action
  fetch() async {
    isLoading = true;

    if (_cachedMovies.isEmpty || !_cachedMovies.keys.contains(page)) {
      moviesList = await _getFromListUseCase(list: listId, page: page);
      _cachedMovies[page] = moviesList!.movies;
    } else {
      moviesList = moviesList!.copyWith(movies: _cachedMovies[page]!);
    }

    if (textController.text.isNotEmpty) onSearch(textController.text);

    isLoading = false;
  }

  @action
  onSearch(String value) {
    if (_cachedMovies.isEmpty) return;

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
