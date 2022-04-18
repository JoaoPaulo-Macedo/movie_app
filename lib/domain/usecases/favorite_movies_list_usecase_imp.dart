import 'package:movie_app/domain/entities/list_identifier_entity.dart';
import 'package:movie_app/domain/repositories/favorite_movies_list_repository.dart';
import 'package:movie_app/domain/usecases/favorite_movies_list_usecase.dart';

class FavoriteMoviesListsUseCaseImp extends FavoriteMoviesListsUseCase {
  FavoriteMoviesListsUseCaseImp(this._repository);

  final FavoriteMoviesListRepository _repository;

  @override
  Future<List<ListIdentifierEntity>> getFavorites() async {
    return await _repository.getLists();
  }

  @override
  addFavorite(int listId) {
    _repository.addList(listId);
  }

  @override
  removeFavorite(int listId) => _repository.removeList(listId);

  @override
  clearFavorites() => _repository.clear();
}
