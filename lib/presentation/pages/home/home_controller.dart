import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:movie_app/domain/entities/list_identifier_entity.dart';
import 'package:movie_app/domain/usecases/get_lists_usecase.dart';

part 'home_controller.g.dart';

class HomeController = _HomeController with _$HomeController;

abstract class _HomeController with Store {
  _HomeController(this.usecase) {
    fetch();
  }

  final GetAllListsUseCase usecase;

  @observable
  List<ListIdentifierEntity> lists = [];
  @observable
  bool isLoading = true;

  @action
  fetch() async {
    lists = await usecase();

    isLoading = false;
  }

  @action
  openListPage(BuildContext context, int listId) {
    //TODO: ask how to solve it
    Navigator.pushNamed(context, '/movies_list', arguments: listId);
  }
}
