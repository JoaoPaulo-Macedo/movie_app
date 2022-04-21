import 'package:dio/dio.dart';
import 'package:movie_app/app/data/datasource/account_details_datasource.dart';
import 'package:movie_app/app/data/datasource/auth_local_datasource.dart';
import 'package:movie_app/app/data/dtos/favorite_movies_list_dto.dart';
import 'package:movie_app/app/domain/entities/account_details_entity.dart';
import 'package:movie_app/app/domain/entities/favorite_movies_list_entity.dart';
import 'package:movie_app/core/domain/services/http_service.dart';
import 'package:movie_app/core/utils/api_utils.dart';

abstract class FavoriteMoviesDataSource {
  Future<FavoriteMoviesListEntity> call(int page);
}

class FavoriteMoviesDataSourceImp extends FavoriteMoviesDataSource {
  FavoriteMoviesDataSourceImp(
    this._service,
    this._accountDetails,
    this._sessionId,
  );

  final HttpService _service;
  final AccountDetailsDataSource _accountDetails;
  final AuthenticationLocalDataSource _sessionId;
  // final GetAccountDetailsUseCase _accountDetails;
  // final GetSessionIdUseCase _sessionId;

  @override
  Future<FavoriteMoviesListEntity> call(int page) async {
    try {
      final accountId = await _getAccountId();
      final sessionId = await _getSessionId();

      var path = API.requestFavoritesList(
        page: page.toString(),
        accountId: accountId.toString(),
        sessionId: sessionId,
      );

      final Response response = await _service.get(path);

      return FavoriteMoviesListDTO.fromJson(response.data);
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
