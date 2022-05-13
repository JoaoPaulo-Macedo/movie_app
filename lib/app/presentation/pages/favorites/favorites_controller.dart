import 'package:mobx/mobx.dart';
import 'package:movie_app/app/domain/entities/movie_entity.dart';
import 'package:movie_app/app/domain/usecases/get_favorites_usecase.dart';
import 'package:movie_app/app/presentation/pages/list_page/list_controller.dart';
import 'package:movie_app/core/utils/failure.dart';

part 'favorites_controller.g.dart';

class FavoritesController = _FavoritesController with _$FavoritesController;

abstract class _FavoritesController extends ListController with Store {
  _FavoritesController(this._getFavoritesUseCase) {
    init();
  }

  final GetFavoritesUseCase _getFavoritesUseCase;

  @override
  @action
  init() async {
    isLoading = true;

    try {
      listEntity = await _getFavoritesUseCase();

      addMovies(listEntity?.movies);
      cachedMovies = movies;

      isEmpty = false;
      isLoading = false;
    } on Failure catch (f) {
      isLoading = false;
      error = f;
    }
  }

  @override
  @action
  fetchMovies({bool reload = false}) async {
    try {
      var list = await _getFavoritesUseCase();

      return list?.movies;
    } on Failure catch (f) {
      isLoading = false;
      error = f;

      return null;
    }
  }
}
