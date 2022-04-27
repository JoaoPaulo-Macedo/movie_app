import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_app/app/domain/usecases/login_usecase.dart';
import 'package:movie_app/app/presentation/components/app_snackbar.dart';
import 'package:movie_app/core/utils/failure.dart';
import 'package:movie_app/core/utils/routes_name.dart';

part 'login_controller.g.dart';

class LoginController = _LoginController with _$LoginController;

abstract class _LoginController with Store {
  _LoginController(BuildContext context, this._usecase) {
    _fetch(context);
  }

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

  void _fetch(BuildContext context) async {
    //TODO: solve context problem
    //TODO: check if sessionId is still valid, does it have validation date?
    if (await _usecase.isLogedIn()) {
      Navigator.popAndPushNamed(context, RoutesName.splash);
    } else {
      _listenToControllers();
      build = true;
    }
  }

  void _listenToControllers() {
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

    try {
      await _usecase(usernameController.text, passwordController.text);
      //TODO: splash can only enter if session id is ok
      Navigator.popAndPushNamed(context, RoutesName.splash);
    } on Failure catch (e) {
      passwordController.clear();

      //TODO: Should the controller call a ui widget?
      AppSnackBar.show(
        context,
        message: e.message,
        description: e.description,
        type: AppSnackBarType.error,
      );

      isLoading = false;
    }
  }

  @action
  unfocus() {
    usernameFocus.unfocus();
    passwordFocus.unfocus();
  }
}
