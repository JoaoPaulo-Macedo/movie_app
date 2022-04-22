import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/routes_name.dart';

class SplashPageController {
  SplashPageController();
  //TODO: splash will deal with account details and movies;
  void call(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 5));

    Navigator.popAndPushNamed(context, RoutesName.initial);
  }
}
