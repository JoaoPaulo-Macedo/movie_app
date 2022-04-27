import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_app/app/domain/entities/list_identifier_entity.dart';
import 'package:movie_app/app/domain/usecases/get_all_lists_usecase.dart';
import 'package:movie_app/app/presentation/components/app_snackbar.dart';
import 'package:movie_app/app/presentation/pages/movies_list/movies_list_page.dart';
import 'package:movie_app/core/utils/failure.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;
//TODO: Add enum for states: initial, loading, error, success
abstract class _HomeController with Store {
  _HomeController(BuildContext context, this.usecase) {
    _fetch(context);
  }

  final GetAllListsUseCase usecase;

  @observable
  List<ListIdentifierEntity> lists = [];
  @observable
  bool isLoading = true;

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
    //Navigator.pushNamed(context, RoutesName.list, arguments: listId);
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return MoviesListPage(listId: listId);
    }));
  }
}
