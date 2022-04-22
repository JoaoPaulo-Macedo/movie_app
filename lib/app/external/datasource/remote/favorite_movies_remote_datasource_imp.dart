import 'package:dio/dio.dart';
import 'package:movie_app/app/data/datasource/account_details_datasource.dart';
import 'package:movie_app/app/data/datasource/auth_local_datasource.dart';
import 'package:movie_app/app/data/datasource/favorite_movies_remote_datasource.dart';
import 'package:movie_app/app/data/dtos/favorite_movies_list_dto.dart';
import 'package:movie_app/app/domain/entities/account_details_entity.dart';
import 'package:movie_app/app/domain/entities/favorite_movies_list_entity.dart';
import 'package:movie_app/app/domain/entities/movie_entity.dart';
import 'package:movie_app/core/domain/services/http_service.dart';
import 'package:movie_app/core/utils/api_utils.dart';

class FavoriteMoviesRemoteDataSourceImp extends FavoriteMoviesRemoteDataSource {
  FavoriteMoviesRemoteDataSourceImp(
    this._service,
    this._accountDetails,
    this._sessionId,
  );

  //TODO: Can a datasource use other datasource
  final HttpService _service;
  final AccountDetailsDataSource _accountDetails;
  final SessionIdDataSource _sessionId;
  // final GetAccountDetailsUseCase _accountDetails;
  // final GetSessionIdUseCase _sessionId;

  String? sessionId;
  int? accountId;

  @override
  Future<FavoriteMoviesListEntity> getFavorites(int page) async {
    try {
      accountId ??= await _getAccountId();
      sessionId ??= await _getSessionId();

      var path = API.requestFavoritesList(
        page: page.toString(),
        accountId: accountId.toString(),
        sessionId: sessionId!,
      );

      final Response response = await _service.get(
        path,
        description: 'Get list of favorite movies',
      );

      return FavoriteMoviesListDTO.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> toggleFavorite(MovieEntity movie, bool favorite) async {
    try {
      accountId ??= await _getAccountId();
      sessionId ??= await _getSessionId();

      var path = API.toggleFavorite(
        accountId: accountId.toString(),
        sessionId: sessionId!,
      );

      final Response response = await _service.post(
        path,
        //TODO: Should I make a model/dto/entity for this?
        queryParams: {
          'media_type': 'movie',
          'media_id': movie.id,
          'favorite': favorite,
        },
        description: 'Post a toggle favorite movie action',
      );

      if (response.statusCode == 200) return true;
      return false;
    } catch (e) {
      rethrow;
    }
  }

  Future<int> _getAccountId() async {
    AccountDetailsEntity? details = await _accountDetails();
    if (details == null) throw Error();

    return details.id;
  }

  Future<String> _getSessionId() async {
    String? sessionId = await _sessionId.getSessionId();
    if (sessionId == null) throw Error();

    return sessionId;
  }
}
