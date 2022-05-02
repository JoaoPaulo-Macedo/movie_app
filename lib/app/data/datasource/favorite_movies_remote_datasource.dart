import 'package:movie_app/app/domain/entities/favorite_movies_list_entity.dart';
import 'package:movie_app/app/domain/entities/movie_entity.dart';

abstract class FavoriteMoviesRemoteDataSource {
  Future<FavoriteMoviesListEntity> getFavorites(int page, int accountId, String sessionId);
  Future<bool> toggleFavorite(MovieEntity movie, bool favorite, int accountId, String sessionId);
}
