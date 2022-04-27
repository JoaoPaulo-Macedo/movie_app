import 'dart:io';

import 'package:dio/dio.dart';
import 'package:movie_app/app/data/datasource/favorite_movies_remote_datasource.dart';
import 'package:movie_app/app/domain/entities/favorite_movies_list_entity.dart';
import 'package:movie_app/app/domain/entities/movie_entity.dart';
import 'package:movie_app/app/domain/repositories/favorite_movies_repository.dart';
import 'package:movie_app/core/utils/failure.dart';

class FavoriteMoviesRepositoryImp extends FavoriteMoviesRepository {
  FavoriteMoviesRepositoryImp(this._remoteDataSource);

  final FavoriteMoviesRemoteDataSource _remoteDataSource;

  @override
  Future<FavoriteMoviesListEntity> getFavorites(int page) async {
    try {
      var list = await _remoteDataSource.getFavorites(page);

      return list;
    } on SocketException {
      throw Failure.connection();
    } on DioError catch (e) {
      throw Failure.fromDioError(e);
    } catch (e) {
      throw Failure.unexpected();
    }
  }

  @override
  Future<bool> toggleFavorite(MovieEntity movie, bool favorite, int page) async {
    try {
      return await _remoteDataSource.toggleFavorite(movie, favorite);
    } on SocketException {
      throw Failure.connection();
    } on DioError catch (e) {
      throw Failure.fromDioError(e);
    } catch (e) {
      throw Failure.unexpected();
    }
  }
}
