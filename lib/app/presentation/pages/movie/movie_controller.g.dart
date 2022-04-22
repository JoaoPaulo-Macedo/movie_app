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

  final _$togglefavoriteAsyncAction =
      AsyncAction('_MovieController.togglefavorite');

  @override
  Future togglefavorite() {
    return _$togglefavoriteAsyncAction.run(() => super.togglefavorite());
  }

  @override
  String toString() {
    return '''
favorite: ${favorite},
isLoading: ${isLoading}
    ''';
  }
}
