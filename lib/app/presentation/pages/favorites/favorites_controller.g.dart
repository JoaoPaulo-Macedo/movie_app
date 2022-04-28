// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FavoritesController on _FavoritesController, Store {
  final _$moviesListAtom = Atom(name: '_FavoritesController.moviesList');

  @override
  FavoriteMoviesListEntity? get moviesList {
    _$moviesListAtom.reportRead();
    return super.moviesList;
  }

  @override
  set moviesList(FavoriteMoviesListEntity? value) {
    _$moviesListAtom.reportWrite(value, super.moviesList, () {
      super.moviesList = value;
    });
  }

  final _$openMoviePageAsyncAction =
      AsyncAction('_FavoritesController.openMoviePage');

  @override
  Future openMoviePage(BuildContext context, MovieEntity movie) {
    return _$openMoviePageAsyncAction
        .run(() => super.openMoviePage(context, movie));
  }

  final _$_FavoritesControllerActionController =
      ActionController(name: '_FavoritesController');

  @override
  bool isListEmpty() {
    final _$actionInfo = _$_FavoritesControllerActionController.startAction(
        name: '_FavoritesController.isListEmpty');
    try {
      return super.isListEmpty();
    } finally {
      _$_FavoritesControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onSearch(String? value) {
    final _$actionInfo = _$_FavoritesControllerActionController.startAction(
        name: '_FavoritesController.onSearch');
    try {
      return super.onSearch(value);
    } finally {
      _$_FavoritesControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic backPage(BuildContext context) {
    final _$actionInfo = _$_FavoritesControllerActionController.startAction(
        name: '_FavoritesController.backPage');
    try {
      return super.backPage(context);
    } finally {
      _$_FavoritesControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic advancePage(BuildContext context) {
    final _$actionInfo = _$_FavoritesControllerActionController.startAction(
        name: '_FavoritesController.advancePage');
    try {
      return super.advancePage(context);
    } finally {
      _$_FavoritesControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
moviesList: ${moviesList}
    ''';
  }
}
