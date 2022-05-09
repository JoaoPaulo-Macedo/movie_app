import 'dart:io';

import 'package:dio/dio.dart';
import 'package:movie_app/app/data/datasource/remote/account_details_remote_datasource.dart';
import 'package:movie_app/app/data/datasource/local/session_id_datasource.dart';
import 'package:movie_app/app/data/datasource/remote/favorites_datasource.dart';
import 'package:movie_app/app/domain/entities/account_details_entity.dart';
import 'package:movie_app/app/domain/entities/movie_entity.dart';
import 'package:movie_app/app/domain/entities/movies_list_entity.dart';
import 'package:movie_app/app/domain/repositories/favorites_repository.dart';
import 'package:movie_app/core/utils/failure.dart';

class FavoritesRepositoryImp extends FavoritesRepository {
  FavoritesRepositoryImp(
    this._remoteDataSource,
    this._accountDetailsDataSource,
    this._sessionIdDataSource,
  );

  final FavoritesDataSource _remoteDataSource;
  final AccountDetailsRemoteDataSource _accountDetailsDataSource;
  final SessionIdDataSource _sessionIdDataSource;

  ListEntity? favorites;
  String? sessionId;
  int? accountId;

  @override
  Future<ListEntity> getFavorites() async {
    try {
      if (favorites != null) return favorites!;

      sessionId ??= await _getSessionId();
      accountId ??= await _getAccountId();

      await _refreshFavorites();

      return favorites!;
    } on SocketException catch (e) {
      throw Failure.connection(e);
    } on DioError catch (e) {
      throw Failure.fromDioError(e);
    } catch (e) {
      rethrow;
    }
  }

  @override
  toggleFavorite(MovieEntity movie, bool favorite, int page) async {
    try {
      accountId ??= await _getAccountId();
      sessionId ??= await _getSessionId();

      await _remoteDataSource.toggleFavorite(movie, favorite, accountId!, sessionId!);

      await _refreshFavorites();
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

  Future _refreshFavorites() async {
    var listEntity = await _remoteDataSource.getFavorites(1, accountId!, sessionId!);

    favorites = listEntity;

    var totalPages = listEntity.totalPages;

    if (totalPages > 1) {
      for (var page = 2; page <= totalPages; page++) {
        listEntity = await _remoteDataSource.getFavorites(page, accountId!, sessionId!);

        listEntity.movies?.forEach((movie) {
          favorites?.movies?.add(movie);
        });
      }
    }
  }
}
