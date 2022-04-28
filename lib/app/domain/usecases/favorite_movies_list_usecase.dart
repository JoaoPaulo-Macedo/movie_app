import 'package:movie_app/app/domain/entities/favorite_movies_list_entity.dart';
import 'package:movie_app/app/domain/entities/movie_entity.dart';
import 'package:movie_app/app/domain/repositories/favorite_movies_repository.dart';

abstract class FavoriteMoviesListUseCase {
  Future<FavoriteMoviesListEntity>? getMovies([int page = 1]);
  Future<bool> saveFavorite(MovieEntity movie, int page);
  Future<bool> removeFavorite(MovieEntity movie, int page);
}

class FavoriteMoviesListUseCaseImp extends FavoriteMoviesListUseCase {
  FavoriteMoviesListUseCaseImp(this._repository);

  final FavoriteMoviesRepository _repository;

  @override
  Future<FavoriteMoviesListEntity>? getMovies([int page = 1]) async {
    return await _repository.getFavorites(page);
  }

  @override
  Future<bool> saveFavorite(MovieEntity movie, int page) async {
    return await _repository.toggleFavorite(movie, true, page);
  }

  @override
  Future<bool> removeFavorite(MovieEntity movie, int page) async {
    return await _repository.toggleFavorite(movie, false, page);
  }
}
