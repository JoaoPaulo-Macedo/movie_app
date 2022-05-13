import 'package:flutter/material.dart';
import 'package:movie_app/app/presentation/pages/initial/app_initial_widget.dart';
import 'package:movie_app/core/inject/inject.dart';
import 'package:movie_app/core/utils/app_configs.dart';

void main() {
  Inject.init();
  AppConfigs(AppEnvironment.prod);

  runApp(const AppInitialWidget());
}
