import 'package:flutter/material.dart';
import 'package:movie_app/core/inject/inject.dart';
import 'package:movie_app/features/movie/presentation/pages/home_page.dart';

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
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
