import 'package:movie_app/app/data/datasource/favorite_movies_local_datasource.dart';
import 'package:movie_app/app/data/datasource/favorite_movies_remote_datasource.dart';
import 'package:movie_app/app/domain/entities/favorite_movies_list_entity.dart';
import 'package:movie_app/app/domain/entities/movie_entity.dart';
import 'package:movie_app/app/domain/repositories/favorite_movies_repository.dart';

class FavoriteMoviesRepositoryImp extends FavoriteMoviesRepository {
  FavoriteMoviesRepositoryImp(this._remoteDataSource/* , this._localDataSource */);

  final FavoriteMoviesRemoteDataSource _remoteDataSource;
  // final FavoriteMoviesLocalDataSource _localDataSource;

  @override
  Future<FavoriteMoviesListEntity> getFavorites(int page) async {
    try {
      // FavoriteMoviesListEntity? list = await _localDataSource.getFavorites(page);

      // if (list != null) return list;

      var list = await _remoteDataSource.getFavorites(page);
      // _localDataSource.updateList(list);

      return list;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> toggleFavorite(MovieEntity movie, bool favorite, int page) async {
    try {
      return await _remoteDataSource.toggleFavorite(movie, favorite);

      // var updatedList = await _remoteDataSource.getFavorites(page);
      // bool local = await _localDataSource.updateList(updatedList);

      // return remote && local;
    } catch (e) {
      rethrow;
    }
  }
}
