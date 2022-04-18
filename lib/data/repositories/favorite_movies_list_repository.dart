import 'package:movie_app/data/datasource/favorites_movies_list_datasource.dart';
import 'package:movie_app/domain/entities/list_identifier_entity.dart';
import 'package:movie_app/domain/repositories/favorite_movies_list_repository.dart';

class FavoriteMoviesListRepositoryImp extends FavoriteMoviesListRepository {
  FavoriteMoviesListRepositoryImp(this._datasource);

  final FavoriteMoviesListDatasource _datasource;

  @override
  Future<List<ListIdentifierEntity>> getLists() async {
    return await _datasource.getList();
  }

  @override
  void addList(int listId) {
    _datasource.saveList(listId);
  }

  @override
  void removeList(int listId) {
    _datasource.removeList(listId.toString());
  }

  @override
  void clear() {
    _datasource.clear();
  }
}
