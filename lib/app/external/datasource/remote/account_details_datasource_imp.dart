import 'package:dio/dio.dart';
import 'package:movie_app/app/data/datasource/account_details_datasource.dart';
import 'package:movie_app/app/data/dtos/account_details_dto.dart';
import 'package:movie_app/app/domain/entities/account_details_entity.dart';
import 'package:movie_app/core/domain/services/http_service.dart';
import 'package:movie_app/core/utils/api_utils.dart';

class AccountDetailsDataSourceImp extends AccountDetailsDataSource {
  AccountDetailsDataSourceImp(this._service);

  final HttpService _service;
  String? sessionId;

  @override
  Future<AccountDetailsEntity?> call(String sessionId) async {
    final path = API.requestAccountDetails(sessionId);
    final Response response = await _service.get(
      path,
      description: 'Get account details',
    );

    var accountDetails = AccountDetailsDTO.fromJson(response.data);

    return accountDetails;
  }
}
