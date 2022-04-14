import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app/presentation/controllers/splash_page_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    var controller = GetIt.instance.get<SplashPageController>();
    controller(context);
  }

  @override
  Widget build(BuildContext context) {
    
    return Center(child: Lottie.asset('assets/lottie.json', height: 250));
  }
}
