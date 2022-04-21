import 'package:movie_app/app/data/datasource/favorite_movies_datasource.dart';
import 'package:movie_app/app/domain/entities/favorite_movies_list_entity.dart';
import 'package:movie_app/app/domain/repositories/favorite_movies_repository.dart';

class FavoriteMoviesRepositoryImp extends FavoriteMoviesRepository {
  FavoriteMoviesRepositoryImp(this._dataSource);

  final FavoriteMoviesDataSource _dataSource;

  @override
  Future<FavoriteMoviesListEntity> call(int page) async {
    try {
      return await _dataSource(page);
    } catch (e) {
      rethrow;
    }
  }
}
