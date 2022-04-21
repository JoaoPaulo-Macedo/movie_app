import 'package:movie_app/app/domain/entities/favorite_movies_list_entity.dart';
import 'package:movie_app/app/domain/repositories/favorite_movies_repository.dart';

abstract class GetFavoriteMoviesListUseCase {
  Future<FavoriteMoviesListEntity> call(int page);
}

class GetFavoriteMoviesListUseCaseImp extends GetFavoriteMoviesListUseCase {
  GetFavoriteMoviesListUseCaseImp(this._repository);

  final FavoriteMoviesRepository _repository;

  @override
  Future<FavoriteMoviesListEntity> call(int page) async {
    return await _repository(page);
  }
}
