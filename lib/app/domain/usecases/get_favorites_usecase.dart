import 'package:movie_app/app/domain/entities/movie_entity.dart';
import 'package:movie_app/app/domain/entities/movies_list_entity.dart';
import 'package:movie_app/app/domain/repositories/favorites_repository.dart';

abstract class FavoriteMoviesListUseCase {
  Future<ListEntity>? getMovies([int page = 1]);
  Future saveFavorite(MovieEntity movie, int page);
  Future removeFavorite(MovieEntity movie, int page);
}

class FavoriteMoviesListUseCaseImp extends FavoriteMoviesListUseCase {
  FavoriteMoviesListUseCaseImp(this._repository);

  final FavoritesRepository _repository;

  @override
  Future<ListEntity>? getMovies([int page = 1]) async {
    return await _repository.getFavorites(page);
  }

  @override
  saveFavorite(MovieEntity movie, int page) async {
    return await _repository.toggleFavorite(movie, true, page);
  }

  @override
  removeFavorite(MovieEntity movie, int page) async {
    return await _repository.toggleFavorite(movie, false, page);
  }
}
