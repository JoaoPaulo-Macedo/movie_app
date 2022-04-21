import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_app/app/domain/usecases/login_usecase.dart';

part 'login_controller.g.dart';

class LoginController = _LoginController with _$LoginController;

abstract class _LoginController with Store {
  _LoginController(this._usecase, {this.context}) {
    fetch();
  }

  final BuildContext? context;
  final LoginUseCase _usecase;
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
  String errorMessage = '';

  void fetch() async {
    //TODO: solve context problem
    if (await _usecase.isLogedIn()) {
      print('Vamos ver essa p00taria');
      Navigator.popAndPushNamed(context!, '/splash');
    } else {
      print('Que viagem');
      listenToControllers();
      build = true;
    }
  }

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
      errorMessage = 'Failed to Login';
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
