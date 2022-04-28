import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_app/app/domain/entities/movie_entity.dart';

part 'list_controller.g.dart';

abstract class ListController = _ListController with _$ListController;

abstract class _ListController with Store {
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

  onSearch(String? value);
}
