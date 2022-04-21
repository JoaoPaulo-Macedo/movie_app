import 'package:dio/dio.dart';
import 'package:movie_app/app/data/datasource/account_details_datasource.dart';
import 'package:movie_app/app/data/datasource/auth_local_datasource.dart';
import 'package:movie_app/app/data/dtos/account_details_dto.dart';
import 'package:movie_app/app/domain/entities/account_details_entity.dart';
import 'package:movie_app/app/external/datasource/local/account_details_local_datasource_imp.dart';
import 'package:movie_app/core/domain/services/http_service.dart';
import 'package:movie_app/core/utils/api_utils.dart';

class AccountDetailsDataSourceImp extends AccountDetailsDataSource {
  AccountDetailsDataSourceImp(
    this._service,
    this._authLocalDataSource,
  );

  final HttpService _service;
  final AuthenticationLocalDataSource _authLocalDataSource;
  //TODO: solve it with a decorator? I can't depend on an implementation

  @override
  Future<AccountDetailsEntity?> call() async {
    final String? sessionId = await _authLocalDataSource.getSessionId();
    print('sessionId:');
    print(sessionId);
    if (sessionId == null) return null;

    final path = API.requestAccountDetails(sessionId);
    final Response response = await _service.get(path);

    var accountDetails = AccountDetailsDTO.fromJson(response.data);
    print('accountDetails from API:');
    print(accountDetails);

    return accountDetails;
  }
}
