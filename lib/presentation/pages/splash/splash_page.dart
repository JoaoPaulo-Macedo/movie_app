import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app/presentation/pages/splash/splash_page_controller.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  void callHomePage(BuildContext context) {
    var controller = SplashPageController();
    // var controller = GetIt.instance.get<SplashPageController>();
    controller(context);
  }

  @override
  Widget build(BuildContext context) {
    callHomePage(context);

    return Center(child: Lottie.asset('assets/lottie.json', height: 250));
  }
}
