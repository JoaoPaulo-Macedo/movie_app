// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_list_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MoviesListController on _MoviesListController, Store {
  final _$listIdAtom = Atom(name: '_MoviesListController.listId');

  @override
  int get listId {
    _$listIdAtom.reportRead();
    return super.listId;
  }

  @override
  set listId(int value) {
    _$listIdAtom.reportWrite(value, super.listId, () {
      super.listId = value;
    });
  }

  final _$initAsyncAction = AsyncAction('_MoviesListController.init');

  @override
  Future<dynamic> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$fetchMoviesAsyncAction =
      AsyncAction('_MoviesListController.fetchMovies');

  @override
  Future<List<MovieEntity>?> fetchMovies() {
    return _$fetchMoviesAsyncAction.run(() => super.fetchMovies());
  }

  @override
  String toString() {
    return '''
listId: ${listId}
    ''';
  }
}
