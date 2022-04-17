import 'package:flutter/material.dart';
import 'package:movie_app/domain/usecases/get_movies_from_list_usecase.dart';

class SplashPageController {
  SplashPageController();

  void call(BuildContext context) async {
    
    await Future.delayed(const Duration(seconds: 4));

    Navigator.popAndPushNamed(context, '/movies_list_page');
  }
}
