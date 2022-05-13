// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ListController on _ListController, Store {
  final _$moviesAtom = Atom(name: '_ListController.movies');

  @override
  List<MovieEntity> get movies {
    _$moviesAtom.reportRead();
    return super.movies;
  }

  @override
  set movies(List<MovieEntity> value) {
    _$moviesAtom.reportWrite(value, super.movies, () {
      super.movies = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_ListController.isLoading');

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

  final _$isSearchingAtom = Atom(name: '_ListController.isSearching');

  @override
  bool get isSearching {
    _$isSearchingAtom.reportRead();
    return super.isSearching;
  }

  @override
  set isSearching(bool value) {
    _$isSearchingAtom.reportWrite(value, super.isSearching, () {
      super.isSearching = value;
    });
  }

  final _$onSearchAsyncAction = AsyncAction('_ListController.onSearch');

  @override
  Future onSearch(String? value) {
    return _$onSearchAsyncAction.run(() => super.onSearch(value));
  }

  final _$_ListControllerActionController =
      ActionController(name: '_ListController');

  @override
  bool isListEmpty() {
    final _$actionInfo = _$_ListControllerActionController.startAction(
        name: '_ListController.isListEmpty');
    try {
      return super.isListEmpty();
    } finally {
      _$_ListControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
movies: ${movies},
isLoading: ${isLoading},
isSearching: ${isSearching}
    ''';
  }
}
