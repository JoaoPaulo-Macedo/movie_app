import 'package:movie_app/domain/entities/list_identifier_entity.dart';

abstract class FavoriteMoviesListRepository {
  Future<List<ListIdentifierEntity>> getLists();

  void addList(int listId);

  void removeList(int listId);

  void clear();
}
