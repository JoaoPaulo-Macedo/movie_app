import 'package:dio/dio.dart';
import 'package:movie_app/app/data/datasource/auth_remote_datasource.dart';
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
      queryParamaters: requestBody,
    );

    return RequestTokenDTO.fromJson(response.data);
  }

  @override
  Future<String> createSession(Map<String, dynamic> requestBody) async {
    final Response response = await _httpService.post(
      API.createSession,
      queryParamaters: requestBody,
    );

    //session id: 01347c6d5e30edc15b253ba5a0e9eaf1b8920590

    return response.data['success'] ? response.data['session_id'] : null;
  }
}
