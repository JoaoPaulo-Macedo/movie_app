import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/app/domain/usecases/get_favorites_usecase.dart';
import 'package:movie_app/app/presentation/components/app_snackbar.dart';
import 'package:movie_app/app/presentation/pages/list_page/list_page.dart';
import 'package:movie_app/app/presentation/pages/favorites/favorites_controller.dart';
import 'package:movie_app/core/utils/failure.dart';

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
      GetIt.instance.get<GetFavoritesUseCase>(),
      snackBar: snackBar,
    );
  }

  snackBar(Failure f) {
    AppSnackBar.show(
      context,
      message: f.message,
      description: f.description,
      type: AppSnackBarType.error,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListPage(controller, type: ListPageType.favorite, errorMessage: 'You have no favorites :(');
  }
}
