import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_app/app/domain/entities/movies_list_entity.dart';
import 'package:movie_app/app/domain/usecases/get_all_lists_usecase.dart';
import 'package:movie_app/app/presentation/pages/movies_list/movies_list_page.dart';
import 'package:movie_app/core/utils/failure.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  _HomeController(this.usecase, {required this.snackBar}) {
    _fetch();
  }

  final GetAllListsUseCase usecase;
  final Function(Failure f) snackBar;

  @observable
  List<ListEntity> lists = [];
  @observable
  bool isLoading = true;

  void _fetch() async {
    try {
      lists = await usecase();

      isLoading = false;
    } on Failure catch (f) {
      _onFailure(f);
    }
  }

  @action
  openListPage(BuildContext context, int listId) {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return MoviesListPage(listId: listId);
    }));
  }

  _onFailure(Failure f) {
    snackBar(f);

    isLoading = false;
  }
}
