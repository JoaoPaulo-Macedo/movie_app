import 'package:flutter/cupertino.dart';
import 'package:movie_app/app/domain/usecases/login_usecase.dart';

class AppDrawerController {
  AppDrawerController(this._usecase);

  final LoginUseCase _usecase;

  logOut(BuildContext context) async {
    await _usecase.logOut();

    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }
}
