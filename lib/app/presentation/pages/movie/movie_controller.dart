import 'package:mobx/mobx.dart';
import 'package:movie_app/app/domain/entities/favorite_movies_list_entity.dart';
import 'package:movie_app/app/domain/entities/movie_entity.dart';
import 'package:movie_app/app/domain/usecases/favorite_movies_list_usecase.dart';

part 'movie_controller.g.dart';

class MovieController = _MovieController with _$MovieController;

// TODO: make favorites and home controller one
abstract class _MovieController with Store {
  _MovieController(this._favoriteUseCase, this.movie) {
    init();
  }

  final FavoriteMoviesListUseCase _favoriteUseCase;
  final MovieEntity movie;

  @observable
  bool favorite = false;
  @observable
  bool isLoading = true;
  @observable
  int page = 1;

  init() async {
    //TODO: get from cache, repository decides
    FavoriteMoviesListEntity favorites = await _favoriteUseCase.getMovies();
    favorite = favorites.movies.any((e) => e.id == movie.id);

    isLoading = false;
  }

  @action
  togglefavorite() async {
    if (isLoading) return;

    isLoading = true;

    if (favorite) {
      favorite = !favorite;
      await _favoriteUseCase.removeFavorite(movie, page);
    } else {
      favorite = !favorite;
      await _favoriteUseCase.saveFavorite(movie, page);
    }

    isLoading = false;
  }
}
