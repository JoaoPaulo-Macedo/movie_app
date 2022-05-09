import 'package:movie_app/app/domain/entities/movie_entity.dart';
import 'package:movie_app/app/domain/repositories/favorites_repository.dart';

abstract class SaveFavoriteUseCase {
  Future call(MovieEntity movie, int page);
}

class SaveFavoriteUseCaseImp extends SaveFavoriteUseCase {
  SaveFavoriteUseCaseImp(this._repository);

  final FavoritesRepository _repository;

  @override
  call(MovieEntity movie, int page) async {
    return await _repository.toggleFavorite(movie, true, page);
  }

}
