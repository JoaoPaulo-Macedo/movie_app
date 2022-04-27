// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginController, Store {
  final _$buildAtom = Atom(name: '_LoginController.build');

  @override
  bool get build {
    _$buildAtom.reportRead();
    return super.build;
  }

  @override
  set build(bool value) {
    _$buildAtom.reportWrite(value, super.build, () {
      super.build = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_LoginController.isLoading');

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

  final _$logInAsyncAction = AsyncAction('_LoginController.logIn');

  @override
  Future logIn(BuildContext context) {
    return _$logInAsyncAction.run(() => super.logIn(context));
  }

  final _$_LoginControllerActionController =
      ActionController(name: '_LoginController');

  @override
  dynamic unfocus() {
    final _$actionInfo = _$_LoginControllerActionController.startAction(
        name: '_LoginController.unfocus');
    try {
      return super.unfocus();
    } finally {
      _$_LoginControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
build: ${build},
isLoading: ${isLoading},
isSignInEnabled: ${isSignInEnabled}
    ''';
  }
}
