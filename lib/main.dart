import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/app/presentation/pages/favorites/favorites_page.dart';
import 'package:movie_app/app/presentation/pages/home/home_page.dart';
import 'package:movie_app/app/presentation/pages/list/list_page.dart';
import 'package:movie_app/app/presentation/pages/login/login_page.dart';
import 'package:movie_app/app/presentation/pages/splash/splash_page.dart';
import 'package:movie_app/core/utils/app_configs.dart';
import 'package:movie_app/core/utils/routes_name.dart';

void main() {
  AppConfigs.debug = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  final primaryColor = const Color.fromARGB(255, 221, 164, 30);
  final cardColor = const Color.fromARGB(255, 15, 15, 15);
  final buttonColor = const Color.fromARGB(255, 130, 90, 0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        primaryColor: primaryColor,
        cardColor: cardColor,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(backgroundColor: cardColor),
        drawerTheme: const DrawerThemeData(
          backgroundColor: Colors.black87,
          elevation: 0,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(buttonColor),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: RoutesName.login,
      routes: {
        RoutesName.login: (context) => const LoginPage(),
        RoutesName.splash: (context) => const SplashPage(),
        RoutesName.initial: (context) => const HomePage(),
        RoutesName.list: (context) => const ListPage(),
        RoutesName.favorites: (context) => const FavoritesPage(),
      },
    );
  }
}
