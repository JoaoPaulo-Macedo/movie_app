import 'dart:io';

import 'package:dio/dio.dart';
import 'package:movie_app/app/data/datasource/account_details_datasource.dart';
import 'package:movie_app/app/data/datasource/auth_local_datasource.dart';
import 'package:movie_app/app/data/datasource/favorite_movies_remote_datasource.dart';
import 'package:movie_app/app/domain/entities/account_details_entity.dart';
import 'package:movie_app/app/domain/entities/favorite_movies_list_entity.dart';
import 'package:movie_app/app/domain/entities/movie_entity.dart';
import 'package:movie_app/app/domain/entities/movies_list_entity.dart';
import 'package:movie_app/app/domain/repositories/favorite_movies_repository.dart';
import 'package:movie_app/core/utils/failure.dart';

class FavoriteMoviesRepositoryImp extends FavoriteMoviesRepository {
  FavoriteMoviesRepositoryImp(
    this._remoteDataSource,
    this._accountDetailsDataSource,
    this._sessionIdDataSource,
  );

  final FavoriteMoviesRemoteDataSource _remoteDataSource;
  final AccountDetailsDataSource _accountDetailsDataSource;
  final SessionIdDataSource _sessionIdDataSource;

  String? sessionId;
  int? accountId;

  @override
  Future<ListEntity> getFavorites(int page) async {
    try {
      sessionId ??= await _getSessionId();
      accountId ??= await _getAccountId();

      var list = await _remoteDataSource.getFavorites(page, accountId!, sessionId!);

      return list;
    } on SocketException catch (e) {
      throw Failure.connection(e);
    } on DioError catch (e) {
      throw Failure.fromDioError(e);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> toggleFavorite(MovieEntity movie, bool favorite, int page) async {
    try {
      accountId ??= await _getAccountId();
      sessionId ??= await _getSessionId();

      return await _remoteDataSource.toggleFavorite(movie, favorite, accountId!, sessionId!);
    } on SocketException catch (e) {
      throw Failure.connection(e);
    } on DioError catch (e) {
      throw Failure.fromDioError(e);
    } catch (e) {
      throw Failure.unexpected(e);
    }
  }

  Future<String> _getSessionId() async {
    String? sessionId = await _sessionIdDataSource.getSessionId();

    return sessionId!;
  }

  Future<int> _getAccountId() async {
    AccountDetailsEntity? details = await _accountDetailsDataSource(sessionId!);

    return details!.id;
  }
}
