import 'package:movie_app/domain/entities/favorite_movies_list_entity.dart';

abstract class FavoriteMoviesListsUseCase {
  Future<List<FavoriteMoviesListEntity>> getFavorites();

  addFavorite(int listId, String listName);

  removeFavorite(int listId);

  clearFavorites();
}
