import 'package:mobx/mobx.dart';
import 'package:movie_app/domain/entities/movie_entity.dart';
import 'package:movie_app/domain/entities/movies_list_entity.dart';
import 'package:movie_app/domain/usecases/get_movies_from_list_usecase.dart';
import 'package:movie_app/presentation/dtos/movies_list_dto.dart';

// Include generated file
part 'home_controller.g.dart';

// This is the class used by rest of your codebase
class HomeControllerMobx = _HomeControllerMobx with _$HomeControllerMobx;

// The store-class
abstract class _HomeControllerMobx with Store {
  _HomeControllerMobx(this._getFromListUseCase, {this.moviesList});

  final GetMoviesFromListUseCase _getFromListUseCase;

  @observable
  MoviesListEntity? moviesList;
  @observable
  MoviesListEntity? _cachedMoviesList;
  @observable
  bool isLoading = false;
  @observable
  int list = 1;
  @observable
  int page = 1;

  @action
  fetch() async {
    isLoading = true;

    try {
      moviesList = await _getFromListUseCase(list: list, page: page);
      _cachedMoviesList = moviesList;
      isLoading = false;
    } catch (e) {
      rethrow;
    }
  }

  @action
  onChanged(String value) {
    if (_cachedMoviesList == null) return;

    List<MovieEntity> list = _cachedMoviesList!.movies
        .where((e) => e.title.toLowerCase().contains(value.toLowerCase()))
        .toList();

    moviesList = moviesList!.copyWith(movies: list);
  }

  @action
  backPage() {
    if (page == 1) return;

    page -= 1;

    fetch();
  }

  @action
  advancePage() {
    if (page == moviesList!.totalPages) return;

    page += 1;

    fetch();
  }
}
