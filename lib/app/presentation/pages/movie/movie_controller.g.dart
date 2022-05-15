// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MovieController on _MovieController, Store {
  final _$isFavoriteAtom = Atom(name: '_MovieController.isFavorite');

  @override
  bool get isFavorite {
    _$isFavoriteAtom.reportRead();
    return super.isFavorite;
  }

  @override
  set isFavorite(bool value) {
    _$isFavoriteAtom.reportWrite(value, super.isFavorite, () {
      super.isFavorite = value;
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

  final _$offsetAtom = Atom(name: '_MovieController.offset');

  @override
  double get offset {
    _$offsetAtom.reportRead();
    return super.offset;
  }

  @override
  set offset(double value) {
    _$offsetAtom.reportWrite(value, super.offset, () {
      super.offset = value;
    });
  }

  final _$errorAtom = Atom(name: '_MovieController.error');

  @override
  Failure? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(Failure? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  final _$closeAtom = Atom(name: '_MovieController.close');

  @override
  bool get close {
    _$closeAtom.reportRead();
    return super.close;
  }

  @override
  set close(bool value) {
    _$closeAtom.reportWrite(value, super.close, () {
      super.close = value;
    });
  }

  final _$_initAsyncAction = AsyncAction('_MovieController._init');

  @override
  Future _init() {
    return _$_initAsyncAction.run(() => super._init());
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
isFavorite: ${isFavorite},
isLoading: ${isLoading},
page: ${page},
offset: ${offset},
error: ${error},
close: ${close}
    ''';
  }
}
