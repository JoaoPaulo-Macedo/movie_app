import 'package:movie_app/app/domain/entities/movie_entity.dart';
import 'package:movie_app/app/domain/entities/movies_list_entity.dart';

abstract class FavoritesDataSource {
  Future<ListEntity> getFavorites(int page, int accountId, String sessionId);
  Future<bool> toggleFavorite(MovieEntity movie, bool favorite, int accountId, String sessionId);
}
