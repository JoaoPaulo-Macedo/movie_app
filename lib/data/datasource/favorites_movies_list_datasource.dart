import 'package:movie_app/domain/entities/favorite_movies_list_entity.dart';
import 'package:movie_app/domain/entities/movies_list_entity.dart';

abstract class FavoriteMoviesListDatasource {
  Future<List<FavoriteMoviesListEntity>> getList();

  void saveList(FavoriteMoviesListEntity moviesList);

  void removeList(String listId);

  void clear();
}
