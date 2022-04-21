import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_app/app/domain/usecases/login_usecase.dart';

part 'login_controller.g.dart';

class LoginController = _LoginController with _$LoginController;

abstract class _LoginController with Store {
  _LoginController(this._usecase) {
    listenToControllers();
  }

  final LoginUseCase _usecase;
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameFocus = FocusNode();
  final passwordFocus = FocusNode();

  @observable
  bool isLoading = false;
  @observable
  bool isSignInEnabled = false;

  void listenToControllers() {
    usernameController.addListener(() {
      isSignInEnabled =
          usernameController.text.isNotEmpty && passwordController.text.isNotEmpty;
    });

    passwordController.addListener(() {
      isSignInEnabled =
          usernameController.text.isNotEmpty && passwordController.text.isNotEmpty;
    });
  }

  @action
  logIn(BuildContext context) async {
    isLoading = true;
    if (!await _usecase(usernameController.text, passwordController.text)) {
      isLoading = false;
    } else {
      Navigator.popAndPushNamed(context, '/splash');
    }
  }

  @action
  unfocus() {
    usernameFocus.unfocus();
    passwordFocus.unfocus();
  }
}
