import 'package:dio/dio.dart';
import 'package:movie_app/app/data/datasource/remote/authentication_remote_datasource.dart';
import 'package:movie_app/app/data/dtos/request_token_dto.dart';
import 'package:movie_app/core/domain/services/http_service.dart';
import 'package:movie_app/core/utils/api_utils.dart';

class AuthenticationRemoteDataSourceImp extends AuthenticationRemoteDataSource {
  AuthenticationRemoteDataSourceImp(this._httpService);

  final HttpService _httpService;

  @override
  Future<RequestTokenDTO> getRequestToken() async {
    final Response response = await _httpService.get(API.requestToken);

    return RequestTokenDTO.fromJson(response.data);
  }

  //TODO: do it on a https environment
  @override
  Future<RequestTokenDTO> validateWithLogin(Map<String, dynamic> requestBody) async {
    final Response response = await _httpService.post(
      API.validateWithLogin,
      queryParams: requestBody,
    );

    return RequestTokenDTO.fromJson(response.data);
  }

  @override
  Future<String?> createSession(Map<String, dynamic> requestBody) async {
    final Response response = await _httpService.post(API.createSession, queryParams: requestBody);

    return response.data['success'] ? response.data['session_id'] : null;
  }

  @override
  Future deleteSession(Map<String, dynamic> requestBody) async {
    await _httpService.delete(API.deleteSession, requestBody);
  }
}
