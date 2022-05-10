import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_app/app/domain/entities/movie_entity.dart';
import 'package:movie_app/app/domain/entities/movies_list_entity.dart';

part 'list_controller.g.dart';

abstract class ListController = _ListController with _$ListController;

abstract class _ListController with Store {
  ListEntity? listEntity;
  List<MovieEntity> cachedMovies = [];
  int page = 1;
  int totalPages = 1;
  bool _isFetching = false;
  String? _search;

  FocusNode searchFocus = FocusNode();
  TextEditingController textController = TextEditingController();
  ScrollController scrollController = ScrollController();

  @observable
  List<MovieEntity> movies = [];
  @observable
  bool isLoading = true;
  @observable
  bool isSearching = false;

  Future init();

  Future<List<MovieEntity>?> fetchMovies();

  Future openMoviePage(BuildContext context, MovieEntity movie);

  @action
  bool isListEmpty() => listEntity?.movies == null || listEntity!.movies!.isEmpty;

  @action
  onSearch(String? value) async {
    if (value == null) {
      textController.clear();
      isSearching = false;

      movies = cachedMovies;

      return;
    }

    _search = value;

    if (page < totalPages && !_isFetching) {
      await _fetchAll();

      _showSearch(_search);
    } else if (!_isFetching) {
      _showSearch(_search);
    }
  }

  void addMovies(List<MovieEntity>? list) {
    list?.forEach((movie) {
      movies.add(movie);
    });
  }

  bool changePage() {
    if (page == totalPages) return false;

    page += 1;
    return true;
  }

  Future _fetchAll() async {
    isLoading = true;
    _isFetching = true;

    for (int i = page + 1; i <= totalPages; i++) {
      changePage();

      var list = await fetchMovies();
      list?.forEach((movie) {
        cachedMovies.add(movie);
      });
    }

    isLoading = false;
    _isFetching = false;
  }

  void _showSearch(String? value) {
    if (value == null) return;

    List<MovieEntity> searchList = cachedMovies
        .where(
          (e) => e.title.toLowerCase().contains(value.toLowerCase()),
        )
        .toList();

    movies = searchList;
  }
}
