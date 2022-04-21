import 'package:movie_app/app/domain/entities/favorite_movies_list_entity.dart';

abstract class FavoriteMoviesRepository {
  Future<FavoriteMoviesListEntity> call(int page);
}
