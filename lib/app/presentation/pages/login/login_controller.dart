import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_app/app/domain/usecases/login_user_usecase.dart';

part 'login_controller.g.dart';

class LoginController = _LoginController with _$LoginController;

abstract class _LoginController with Store {
  _LoginController(this._usecase) {
    listenToControllers();
  }

  final LoginUserUseCase _usecase;
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();

  @observable
  bool isSignInEnabled = false;

  void listenToControllers() {
    userNameController.addListener(() {
      isSignInEnabled =
          userNameController.text.isNotEmpty && passwordController.text.isNotEmpty;
    });

    passwordController.addListener(() {
      isSignInEnabled =
          userNameController.text.isNotEmpty && passwordController.text.isNotEmpty;
    });
  }

  @action
  logIn() {
    _usecase(userNameController.text, passwordController.text);
  }
}
