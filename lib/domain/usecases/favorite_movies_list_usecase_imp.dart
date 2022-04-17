import 'package:movie_app/domain/entities/favorite_movies_list_entity.dart';
import 'package:movie_app/domain/repositories/favorite_movies_list_repository.dart';
import 'package:movie_app/domain/usecases/favorite_movies_list_usecase.dart';

class FavoriteMoviesListsUseCaseImp extends FavoriteMoviesListsUseCase {
  FavoriteMoviesListsUseCaseImp(this._repository);

  final FavoriteMoviesListRepository _repository;

  @override
  Future<List<FavoriteMoviesListEntity>> getFavorites() async {
    return await _repository.getLists();
  }

  @override
  addFavorite(int listId, String listName) {
    var favoriteList = FavoriteMoviesListEntity(id: listId, name: listName);

    _repository.addList(favoriteList);
  }

  @override
  removeFavorite(int listId) => _repository.removeList(listId);

  @override
  clearFavorites() => _repository.clear();
}
