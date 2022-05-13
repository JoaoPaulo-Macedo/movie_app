import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_app/app/domain/usecases/login_usecase.dart';
import 'package:movie_app/core/utils/failure.dart';

part 'login_controller.g.dart';

class LoginController = _LoginController with _$LoginController;

abstract class _LoginController with Store {
  _LoginController(this._logInUseCase) {
    _init();
  }

  final LoginUseCase _logInUseCase;

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
  @observable
  bool showPassword = false;

  void _init() {
    usernameController.addListener(() {
      isSignInEnabled = usernameController.text.isNotEmpty && passwordController.text.isNotEmpty;
    });

    passwordController.addListener(() {
      isSignInEnabled = usernameController.text.isNotEmpty && passwordController.text.isNotEmpty;
    });

    build = true;
  }

  @action
  Future<Object> logIn() async {
    isLoading = true;

    try {
      await _logInUseCase(usernameController.text, passwordController.text);

      return true;
    } on Failure catch (f) {
      passwordController.clear();

      isLoading = false;
      return f;
    }
  }

  @action
  unfocus() {
    usernameFocus.unfocus();
    passwordFocus.unfocus();
  }
}
