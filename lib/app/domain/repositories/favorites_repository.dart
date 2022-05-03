import 'package:movie_app/app/domain/entities/favorite_movies_list_entity.dart';
import 'package:movie_app/app/domain/entities/movie_entity.dart';
import 'package:movie_app/app/domain/entities/movies_list_entity.dart';

abstract class FavoritesRepository {
  Future<ListEntity> getFavorites(int page);
  Future toggleFavorite(MovieEntity movie, bool favorite, int page);
}
