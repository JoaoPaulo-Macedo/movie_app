// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeControllerMobx on _HomeControllerMobx, Store {
  final _$moviesListAtom = Atom(name: '_HomeControllerMobx.moviesList');

  @override
  MoviesListEntity? get moviesList {
    _$moviesListAtom.reportRead();
    return super.moviesList;
  }

  @override
  set moviesList(MoviesListEntity? value) {
    _$moviesListAtom.reportWrite(value, super.moviesList, () {
      super.moviesList = value;
    });
  }

  final _$_cachedMoviesListAtom =
      Atom(name: '_HomeControllerMobx._cachedMoviesList');

  @override
  MoviesListEntity? get _cachedMoviesList {
    _$_cachedMoviesListAtom.reportRead();
    return super._cachedMoviesList;
  }

  @override
  set _cachedMoviesList(MoviesListEntity? value) {
    _$_cachedMoviesListAtom.reportWrite(value, super._cachedMoviesList, () {
      super._cachedMoviesList = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_HomeControllerMobx.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$listAtom = Atom(name: '_HomeControllerMobx.list');

  @override
  int get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(int value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  final _$pageAtom = Atom(name: '_HomeControllerMobx.page');

  @override
  int get page {
    _$pageAtom.reportRead();
    return super.page;
  }

  @override
  set page(int value) {
    _$pageAtom.reportWrite(value, super.page, () {
      super.page = value;
    });
  }

  final _$fetchAsyncAction = AsyncAction('_HomeControllerMobx.fetch');

  @override
  Future fetch() {
    return _$fetchAsyncAction.run(() => super.fetch());
  }

  final _$_HomeControllerMobxActionController =
      ActionController(name: '_HomeControllerMobx');

  @override
  dynamic onChanged(String value) {
    final _$actionInfo = _$_HomeControllerMobxActionController.startAction(
        name: '_HomeControllerMobx.onChanged');
    try {
      return super.onChanged(value);
    } finally {
      _$_HomeControllerMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic backPage() {
    final _$actionInfo = _$_HomeControllerMobxActionController.startAction(
        name: '_HomeControllerMobx.backPage');
    try {
      return super.backPage();
    } finally {
      _$_HomeControllerMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic advancePage() {
    final _$actionInfo = _$_HomeControllerMobxActionController.startAction(
        name: '_HomeControllerMobx.advancePage');
    try {
      return super.advancePage();
    } finally {
      _$_HomeControllerMobxActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
moviesList: ${moviesList},
isLoading: ${isLoading},
list: ${list},
page: ${page}
    ''';
  }
}
