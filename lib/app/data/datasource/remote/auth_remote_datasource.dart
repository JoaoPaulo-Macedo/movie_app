import 'package:movie_app/app/data/dtos/request_token_dto.dart';

abstract class AuthenticationRemoteDataSource {
  Future<RequestTokenDTO> getRequestToken();
  Future<RequestTokenDTO> validateWithLogin(Map<String, dynamic> requestBody);
  Future<String?> createSession(Map<String, dynamic> requestBody);
  Future deleteSession(Map<String, dynamic> requestBody);
}
