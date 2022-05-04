import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_app/app/domain/entities/movie_entity.dart';
import 'package:movie_app/app/domain/entities/movies_list_entity.dart';
import 'package:movie_app/app/presentation/dtos/movies_list_dto.dart';

part 'list_controller.g.dart';

abstract class ListController = _ListController with _$ListController;

abstract class _ListController with Store {
  @observable
  ListEntity? listEntity;
  @observable
  List<MovieEntity> movies = [];
  @observable
  // ignore: prefer_final_fields
  Map<int, List<MovieEntity>> cachedMovies = {};
  @observable
  int page = 1;

  @observable
  bool isLoading = true;
  @observable
  bool isSearching = false;
  @observable
  bool isPaginated = false;
  @observable
  FocusNode searchFocus = FocusNode();
  @observable
  TextEditingController textController = TextEditingController();

  Future fetch(BuildContext context);

  Future openMoviePage(BuildContext context, MovieEntity movie);

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

    movies = searchList;
  }

  @action
  bool isListEmpty() => listEntity?.movies == null || listEntity!.movies!.isEmpty;

  @action
  backPage(BuildContext context) {
    if (page == 1) return;
    if (isLoading) return;

    page -= 1;

    fetch(context);
  }

  @action
  advancePage(BuildContext context) {
    if (page == listEntity!.totalPages) return;
    if (isLoading) return;

    page += 1;

    fetch(context);
  }
}
