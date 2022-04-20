import 'package:flutter/material.dart';
import 'package:movie_app/app/presentation/pages/home/home_page.dart';
import 'package:movie_app/app/presentation/pages/list/list_page.dart';
import 'package:movie_app/app/presentation/pages/login/login_page.dart';
import 'package:movie_app/app/presentation/pages/splash/splash_page.dart';
import 'package:movie_app/core/inject/inject.dart';

void main() {
  Inject.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  final primaryColor = const Color.fromARGB(255, 20, 15, 15);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        primaryColor: primaryColor,
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(backgroundColor: primaryColor),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      routes: {
        '/splash': (_) => const SplashPage(),
        '/login': (_) => const LoginPage(),
        '/': (_) => const HomePage(),
        '/movies_list': (_) => const ListPage(),
      },
    );
  }
}