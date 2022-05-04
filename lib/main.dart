import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/app/presentation/pages/favorites/favorites_page.dart';
import 'package:movie_app/app/presentation/pages/home/home_page.dart';
import 'package:movie_app/app/presentation/pages/login/login_page.dart';
import 'package:movie_app/app/presentation/pages/splash/splash_page.dart';
import 'package:movie_app/core/inject/inject.dart';
import 'package:movie_app/core/utils/app_configs.dart';
import 'package:movie_app/core/utils/routes_name.dart';

void main() {
  Inject.init();
  AppConfigs(AppEnvironment.dev);

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
        textTheme: TextTheme(
          titleLarge: GoogleFonts.lora(fontSize: 25),
          titleMedium: GoogleFonts.lora(fontSize: 23, fontWeight: FontWeight.w600),
          titleSmall: GoogleFonts.lora(fontSize: 15),
        ),
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
        // RoutesName.list: (context) => const ListPage(),
        RoutesName.favorites: (context) => const FavoritesPage(),
      },
    );
  }
}
