import 'package:mobx/mobx.dart';
import 'package:movie_app/app/domain/usecases/is_loged_in_usecase.dart';
import 'package:movie_app/app/presentation/routes_name.dart';

part 'app_initial_widget_controller.g.dart';

class AppInitialWidgetController = _AppInitialWidgetController with _$AppInitialWidgetController;

abstract class _AppInitialWidgetController with Store {
  _AppInitialWidgetController(this._isLogedInUseCase) {
    _init();
  }

  final IsLogedInUseCase _isLogedInUseCase;

  String? initialRoute;
  @observable
  bool isLoading = true;

  void _init() async {
    if (await _isLogedInUseCase()) {
      initialRoute = RoutesName.initial;
      isLoading = false;
    } else {
      initialRoute = RoutesName.login;
      isLoading = false;
    }
  }
}
