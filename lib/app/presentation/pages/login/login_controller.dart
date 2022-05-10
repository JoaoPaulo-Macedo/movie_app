import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_app/app/domain/usecases/is_loged_in_usecase.dart';
import 'package:movie_app/app/domain/usecases/login_usecase.dart';
import 'package:movie_app/core/utils/failure.dart';
import 'package:movie_app/core/utils/routes_name.dart';

part 'login_controller.g.dart';

class LoginController = _LoginController with _$LoginController;

abstract class _LoginController with Store {
  _LoginController(
    BuildContext context,
    this._logInUseCase,
    this._isLogedInUseCase, {
    required this.snackBar,
  }) {
    _init(context);
  }

  final LoginUseCase _logInUseCase;
  final IsLogedInUseCase _isLogedInUseCase;
  final Function(Failure f) snackBar;
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameFocus = FocusNode();
  final passwordFocus = FocusNode();

  @observable
  bool build = false;
  @observable
  bool isLoading = false;
  @observable
  bool isSignInEnabled = false;

  void _init(BuildContext context) async {
    if (await _isLogedInUseCase()) {
      Navigator.popAndPushNamed(context, RoutesName.initial);
    } else {
      _listenToControllers();
      build = true;
    }
  }

  void _listenToControllers() {
    usernameController.addListener(() {
      isSignInEnabled = usernameController.text.isNotEmpty && passwordController.text.isNotEmpty;
    });

    passwordController.addListener(() {
      isSignInEnabled = usernameController.text.isNotEmpty && passwordController.text.isNotEmpty;
    });
  }

  @action
  logIn(BuildContext context) async {
    isLoading = true;

    try {
      await _logInUseCase(usernameController.text, passwordController.text);
      Navigator.popAndPushNamed(context, RoutesName.splash);
    } on Failure catch (f) {
      passwordController.clear();

      _onFailure(f);
    }
  }

  @action
  unfocus() {
    usernameFocus.unfocus();
    passwordFocus.unfocus();
  }

  _onFailure(Failure f) {
    snackBar(f);

    isLoading = false;
  }
}
