import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/app/domain/usecases/get_favorites_usecase.dart';
import 'package:movie_app/app/presentation/pages/common/list_page.dart';
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
      GetIt.instance.get<GetFavoritesUseCase>(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListPage(controller);
  }
}
