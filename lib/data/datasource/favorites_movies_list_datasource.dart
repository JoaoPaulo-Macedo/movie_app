import 'package:movie_app/domain/entities/list_identifier_entity.dart';
import 'package:movie_app/domain/entities/movies_list_entity.dart';

abstract class FavoriteMoviesListDatasource {
  Future<List<ListIdentifierEntity>> getList();

  void saveList(int listId);

  void removeList(String listId);

  void clear();
}
