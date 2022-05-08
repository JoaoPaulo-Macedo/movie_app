import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_app/app/domain/entities/movies_list_entity.dart';
import 'package:movie_app/app/domain/usecases/get_all_lists_usecase.dart';
import 'package:movie_app/app/presentation/components/app_snackbar.dart';
import 'package:movie_app/app/presentation/pages/movies_list/movies_list_page.dart';
import 'package:movie_app/core/utils/failure.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  _HomeController(BuildContext context, this.usecase) {
    _fetch(context);
  }

  final GetAllListsUseCase usecase;

  @observable
  List<ListEntity> lists = [];
  @observable
  bool isLoading = true;
  // TODO: Is this way ok to controll page loading state?

  void _fetch(BuildContext context) async {
    try {
      lists = await usecase();

      isLoading = false;
    } on Failure catch (e) {
      //TODO: Should the controller call a ui widget?
      AppSnackBar.show(
        context,
        message: e.message,
        description: e.description,
        type: AppSnackBarType.error,
      );

      isLoading = false;
    }
  }

  @action
  openListPage(BuildContext context, int listId) {
    //TODO: ask how to solve it
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return MoviesListPage(listId: listId);
    }));
  }
}
