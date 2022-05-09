import 'package:movie_app/app/domain/entities/movies_list_entity.dart';
import 'package:movie_app/app/domain/repositories/favorites_repository.dart';

abstract class GetFavoritesUseCase {
  Future<ListEntity>? call();
}

class GetFavoritesUseCaseImp extends GetFavoritesUseCase {
  GetFavoritesUseCaseImp(this._repository);

  final FavoritesRepository _repository;

  @override
  Future<ListEntity>? call() async {
    return await _repository.getFavorites();
  }
}
