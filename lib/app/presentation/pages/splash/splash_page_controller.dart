import 'package:flutter/material.dart';
import 'package:movie_app/core/utils/routes_name.dart';

class SplashPageController {
  SplashPageController();
  void call(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 5));

    Navigator.popAndPushNamed(context, RoutesName.initial);
  }
}
