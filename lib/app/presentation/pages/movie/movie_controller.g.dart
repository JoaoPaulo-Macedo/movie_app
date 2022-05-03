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

  final _$loadingAtom = Atom(name: '_MovieController.loading');

  @override
  ValueNotifier<bool> get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(ValueNotifier<bool> value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
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
  dynamic onClose(BuildContext context) {
    final _$actionInfo = _$_MovieControllerActionController.startAction(
        name: '_MovieController.onClose');
    try {
      return super.onClose(context);
    } finally {
      _$_MovieControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isFavorite: ${isFavorite},
loading: ${loading},
page: ${page},
offset: ${offset}
    ''';
  }
}
