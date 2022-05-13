// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorites_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FavoritesController on _FavoritesController, Store {
  final _$initAsyncAction = AsyncAction('_FavoritesController.init');

  @override
  Future<dynamic> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$fetchMoviesAsyncAction =
      AsyncAction('_FavoritesController.fetchMovies');

  @override
  Future<List<MovieEntity>?> fetchMovies({bool reload = false}) {
    return _$fetchMoviesAsyncAction
        .run(() => super.fetchMovies(reload: reload));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
