import 'package:mobx/mobx.dart';
import 'package:movie_app/app/domain/entities/movies_list_entity.dart';
import 'package:movie_app/app/domain/usecases/get_all_lists_usecase.dart';
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
  @observable
  Failure? error;

  void _fetch() async {
    try {
      lists = await usecase();

      isLoading = false;
    } on Failure catch (f) {
      isLoading = false;
      error = f;
    }
  }
}
