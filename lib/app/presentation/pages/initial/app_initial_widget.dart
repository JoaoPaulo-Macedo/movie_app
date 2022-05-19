import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/app/domain/usecases/is_loged_in_usecase.dart';
import 'package:movie_app/app/presentation/pages/favorites/favorites_page.dart';
import 'package:movie_app/app/presentation/pages/home/home_page.dart';
import 'package:movie_app/app/presentation/pages/login/login_page.dart';
import 'package:movie_app/app/presentation/pages/initial/app_initial_widget_controller.dart';
import 'package:movie_app/app/presentation/pages/splash/splash_page.dart';
import 'package:movie_app/app/presentation/routes_name.dart';

class AppInitialWidget extends StatefulWidget {
  const AppInitialWidget({Key? key}) : super(key: key);

  @override
  State<AppInitialWidget> createState() => _AppInitialWidgetState();
}

class _AppInitialWidgetState extends State<AppInitialWidget> {
  final primaryColor = const Color.fromARGB(255, 221, 164, 30);
  final cardColor = const Color.fromARGB(255, 15, 15, 15);
  final buttonColor = const Color.fromARGB(255, 130, 90, 0);
  late AppInitialWidgetController controller;

  @override
  void initState() {
    super.initState();

    controller = AppInitialWidgetController(GetIt.instance.get<IsLogedInUseCase>());
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Observer(
      builder: (context) {
        if (controller.isLoading) return const SizedBox();

        return MaterialApp(
          title: 'Fav Movies',
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
          initialRoute: controller.initialRoute,
          routes: {
            Routes.login: (context) => const LoginPage(),
            Routes.splash: (context) => const SplashPage(),
            Routes.initial: (context) => const HomePage(),
            Routes.favorites: (context) => const FavoritesPage(),
          },
        );
      },
    );
  }
}
