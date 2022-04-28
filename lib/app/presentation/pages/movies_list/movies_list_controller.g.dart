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

  final _$_MoviesListControllerActionController =
      ActionController(name: '_MoviesListController');

  @override
  dynamic onSearch(String? value) {
    final _$actionInfo = _$_MoviesListControllerActionController.startAction(
        name: '_MoviesListController.onSearch');
    try {
      return super.onSearch(value);
    } finally {
      _$_MoviesListControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic backPage(BuildContext context) {
    final _$actionInfo = _$_MoviesListControllerActionController.startAction(
        name: '_MoviesListController.backPage');
    try {
      return super.backPage(context);
    } finally {
      _$_MoviesListControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic advancePage(BuildContext context) {
    final _$actionInfo = _$_MoviesListControllerActionController.startAction(
        name: '_MoviesListController.advancePage');
    try {
      return super.advancePage(context);
    } finally {
      _$_MoviesListControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic openMoviePage(BuildContext context, MovieEntity movie) {
    final _$actionInfo = _$_MoviesListControllerActionController.startAction(
        name: '_MoviesListController.openMoviePage');
    try {
      return super.openMoviePage(context, movie);
    } finally {
      _$_MoviesListControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listId: ${listId}
    ''';
  }
}
