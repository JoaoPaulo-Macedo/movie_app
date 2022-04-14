import 'package:flutter/material.dart';
import 'package:movie_app/domain/entities/movies_list_entity.dart';
import 'package:movie_app/domain/usecases/get_movies_from_list_usecase.dart';
import 'package:movie_app/presentation/pages/movies_list_page.dart';

class SplashPageController {
  SplashPageController(this._getFromListUseCase);

  final GetMoviesFromListUseCase _getFromListUseCase;
  late MoviesListEntity? moviesList;

  void call(BuildContext context) async {
    try {
      moviesList = await _getFromListUseCase();
    } catch (e) {
      rethrow;
    }

    navigate(context);
  }

  void navigate(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 4));

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MoviesListPage(moviesList: moviesList),
      ),
    );
  }
}
