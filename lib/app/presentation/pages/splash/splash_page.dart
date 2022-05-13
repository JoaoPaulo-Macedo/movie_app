import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app/app/presentation/routes_name.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  void callHomePage(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 5));

    Navigator.popAndPushNamed(context, Routes.initial);
  }

  @override
  Widget build(BuildContext context) {
    callHomePage(context);

    return Center(child: Lottie.asset('assets/lottie.json', height: 250));
  }
}
