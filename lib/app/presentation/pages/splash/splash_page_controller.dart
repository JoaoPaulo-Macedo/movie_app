import 'package:flutter/material.dart';

class SplashPageController {
  SplashPageController();

  void call(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 5));

    Navigator.popAndPushNamed(context, '/initial');
  }
}
