import 'package:movie_app/domain/entities/favorite_movies_list_entity.dart';

abstract class FavoriteMoviesListRepository {
  Future<List<FavoriteMoviesListEntity>> getLists();

  void addList(FavoriteMoviesListEntity list);

  void removeList(int listId);

  void clear();
}
