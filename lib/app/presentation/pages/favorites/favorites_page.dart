import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/app/domain/usecases/get_favorites_usecase.dart';
import 'package:movie_app/app/presentation/components/app_list.dart';
import 'package:movie_app/app/presentation/components/pagination.dart';
import 'package:movie_app/app/presentation/components/search_app_bar.dart';
import 'package:movie_app/app/presentation/pages/common/list_page.dart';
import 'package:movie_app/app/presentation/pages/drawer/app_drawer.dart';
import 'package:movie_app/app/presentation/pages/favorites/favorites_controller.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  late FavoritesController controller;

  @override
  void initState() {
    super.initState();

    controller = FavoritesController(
      context,
      GetIt.instance.get<FavoriteMoviesListUseCase>(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListPage(controller);
  }
}
