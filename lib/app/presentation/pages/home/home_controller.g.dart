// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeController, Store {
  final _$listsAtom = Atom(name: '_HomeController.lists');

  @override
  List<ListEntity> get lists {
    _$listsAtom.reportRead();
    return super.lists;
  }

  @override
  set lists(List<ListEntity> value) {
    _$listsAtom.reportWrite(value, super.lists, () {
      super.lists = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_HomeController.isLoading');

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

  final _$_HomeControllerActionController =
      ActionController(name: '_HomeController');

  @override
  dynamic openListPage(BuildContext context, int listId) {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
        name: '_HomeController.openListPage');
    try {
      return super.openListPage(context, listId);
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
lists: ${lists},
isLoading: ${isLoading}
    ''';
  }
}
