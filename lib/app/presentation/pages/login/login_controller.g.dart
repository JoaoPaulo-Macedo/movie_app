// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginController, Store {
  final _$isSignInEnabledAtom = Atom(name: '_LoginController.isSignInEnabled');

  @override
  bool get isSignInEnabled {
    _$isSignInEnabledAtom.reportRead();
    return super.isSignInEnabled;
  }

  @override
  set isSignInEnabled(bool value) {
    _$isSignInEnabledAtom.reportWrite(value, super.isSignInEnabled, () {
      super.isSignInEnabled = value;
    });
  }

  final _$_LoginControllerActionController =
      ActionController(name: '_LoginController');

  @override
  dynamic logIn() {
    final _$actionInfo = _$_LoginControllerActionController.startAction(
        name: '_LoginController.logIn');
    try {
      return super.logIn();
    } finally {
      _$_LoginControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isSignInEnabled: ${isSignInEnabled}
    ''';
  }
}