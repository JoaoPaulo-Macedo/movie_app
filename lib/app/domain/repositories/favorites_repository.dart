import 'package:movie_app/app/domain/entities/movie_entity.dart';
import 'package:movie_app/app/domain/entities/movies_list_entity.dart';

abstract class FavoritesRepository {
  Future<ListEntity> getFavorites();
  Future toggleFavorite(MovieEntity movie, bool favorite, int page);
}
