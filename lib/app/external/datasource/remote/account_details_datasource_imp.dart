import 'package:dio/dio.dart';
import 'package:movie_app/app/data/datasource/account_details_datasource.dart';
import 'package:movie_app/app/data/datasource/auth_local_datasource.dart';
import 'package:movie_app/app/data/dtos/account_details_dto.dart';
import 'package:movie_app/app/domain/entities/account_details_entity.dart';
import 'package:movie_app/core/domain/services/http_service.dart';
import 'package:movie_app/core/utils/api_utils.dart';

class AccountDetailsDataSourceImp extends AccountDetailsDataSource {
  AccountDetailsDataSourceImp(this._service, this._authDataSource);

  final HttpService _service;
  final AuthenticationLocalDataSource _authDataSource;

  @override
  Future<AccountDetailsEntity>? call() async {
    final String? sessionId = await _authDataSource.getSessionId();
    if (sessionId == null) throw Error();
    final String path = API.requestAccountDetails(sessionId);

    final Response response = await _service.get(path);

    return AccountDetailsDTO.fromJson(response.data);
  }
}
