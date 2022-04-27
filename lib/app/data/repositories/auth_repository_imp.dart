import 'dart:io';

import 'package:dio/dio.dart';
import 'package:movie_app/app/data/datasource/auth_remote_datasource.dart';
import 'package:movie_app/app/data/datasource/auth_local_datasource.dart';
import 'package:movie_app/app/data/dtos/request_token_dto.dart';
import 'package:movie_app/app/domain/entities/login_params_entity.dart';
import 'package:movie_app/app/domain/repositories/auth_repository.dart';
import 'package:movie_app/core/inject/inject.dart';
import 'package:movie_app/core/utils/failure.dart';

class AuthenticationRepositoryImp implements AuthenticationRepository {
  AuthenticationRepositoryImp(
    this._remoteAuthDataSource,
    this._localSessionDataSource,
  );

  final AuthenticationRemoteDataSource _remoteAuthDataSource;
  final SessionIdDataSource _localSessionDataSource;

  @override
  loginUser(LoginParamsEntity loginParams) async {
    try {
      RequestTokenDTO token = await _remoteAuthDataSource.getRequestToken();

      Map<String, dynamic> params = loginParams.toJson();
      params.putIfAbsent('request_token', () => token.requestToken);

      token = await _remoteAuthDataSource.validateWithLogin(params);

      final sessionId = await _remoteAuthDataSource.createSession(
        token.toJson(),
      );

      if (sessionId != null) saveSessionID(sessionId);
    } on SocketException {
      throw Failure.connection();
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        throw Failure(
          'Invalid Credentials!',
          description: e.response?.statusMessage,
        );
      }

      throw Failure.fromDioError(e);
    } catch (e) {
      throw Failure.unexpected();
    }
  }

  Future<bool> saveSessionID(String sessionId) async {
    return await _localSessionDataSource.saveSessionId(sessionId);
  }

  @override
  Future<bool> isLogedIn() async {
    var sessionId = await _localSessionDataSource.getSessionId();

    return sessionId != null;
  }

  @override
  logoutUser() async {
    await _localSessionDataSource.deleteSessionId();
    // TODO: delete session on tmdb remote datasource
    Inject.reset();
  }
}
