import 'package:movie_app/app/domain/entities/movie_entity.dart';
import 'package:movie_app/app/domain/repositories/favorites_repository.dart';

abstract class RemoveFavoriteUseCase {
  Future call(MovieEntity movie, int page);
}

class RemoveFavoriteUseCaseImp extends RemoveFavoriteUseCase {
  RemoveFavoriteUseCaseImp(this._repository);

  final FavoritesRepository _repository;

  @override
  call(MovieEntity movie, int page) async {
    return await _repository.toggleFavorite(movie, false, page);
  }
}
