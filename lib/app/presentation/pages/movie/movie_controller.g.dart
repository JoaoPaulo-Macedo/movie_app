// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MovieController on _MovieController, Store {
  final _$favoriteAtom = Atom(name: '_MovieController.favorite');

  @override
  bool get favorite {
    _$favoriteAtom.reportRead();
    return super.favorite;
  }

  @override
  set favorite(bool value) {
    _$favoriteAtom.reportWrite(value, super.favorite, () {
      super.favorite = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_MovieController.isLoading');

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

  final _$pageAtom = Atom(name: '_MovieController.page');

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

  final _$_MovieControllerActionController =
      ActionController(name: '_MovieController');

  @override
  dynamic togglefavorite() {
    final _$actionInfo = _$_MovieControllerActionController.startAction(
        name: '_MovieController.togglefavorite');
    try {
      return super.togglefavorite();
    } finally {
      _$_MovieControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
favorite: ${favorite},
isLoading: ${isLoading},
page: ${page}
    ''';
  }
}
