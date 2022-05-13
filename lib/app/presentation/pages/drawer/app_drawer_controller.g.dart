// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_drawer_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AppDrawerController on _AppDrawerController, Store {
  final _$accountDetailsAtom =
      Atom(name: '_AppDrawerController.accountDetails');

  @override
  AccountDetailsEntity? get accountDetails {
    _$accountDetailsAtom.reportRead();
    return super.accountDetails;
  }

  @override
  set accountDetails(AccountDetailsEntity? value) {
    _$accountDetailsAtom.reportWrite(value, super.accountDetails, () {
      super.accountDetails = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_AppDrawerController.isLoading');

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

  final _$logOutAsyncAction = AsyncAction('_AppDrawerController.logOut');

  @override
  Future<dynamic> logOut() {
    return _$logOutAsyncAction.run(() => super.logOut());
  }

  final _$_AppDrawerControllerActionController =
      ActionController(name: '_AppDrawerController');

  @override
  bool onTap(dynamic routeName) {
    final _$actionInfo = _$_AppDrawerControllerActionController.startAction(
        name: '_AppDrawerController.onTap');
    try {
      return super.onTap(routeName);
    } finally {
      _$_AppDrawerControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
accountDetails: ${accountDetails},
isLoading: ${isLoading}
    ''';
  }
}
