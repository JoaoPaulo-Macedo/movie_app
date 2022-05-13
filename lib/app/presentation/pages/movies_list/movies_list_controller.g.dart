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

  final _$openMoviePageAsyncAction =
      AsyncAction('_MoviesListController.openMoviePage');

  @override
  Future<dynamic> openMoviePage(MovieEntity movie) {
    return _$openMoviePageAsyncAction.run(() => super.openMoviePage(movie));
  }

  @override
  String toString() {
    return '''
listId: ${listId}
    ''';
  }
}
