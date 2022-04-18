import 'package:movie_app/domain/entities/list_identifier_entity.dart';

abstract class FavoriteMoviesListsUseCase {
  Future<List<ListIdentifierEntity>> getFavorites();

  addFavorite(int listId);

  removeFavorite(int listId);

  clearFavorites();
}
