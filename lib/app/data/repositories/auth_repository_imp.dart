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
  AuthenticationRepositoryImp(this._remoteAuthDataSource, this._localSessionDataSource);

  final AuthenticationRemoteDataSource _remoteAuthDataSource;
  final SessionIdDataSource _localSessionDataSource;

  @override
  Future loginUser(LoginParamsEntity loginParams) async {
    try {
      RequestTokenDTO token = await _remoteAuthDataSource.getRequestToken();

      Map<String, dynamic> params = loginParams.toJson();
      params.putIfAbsent('request_token', () => token.requestToken);

      token = await _remoteAuthDataSource.validateWithLogin(params);

      final sessionId = await _remoteAuthDataSource.createSession(
        token.toJson(),
      );

      if (sessionId != null) _saveSessionID(sessionId);
    } on SocketException catch (e) {
      throw Failure.connection(e);
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        throw Failure(
          'Invalid Credentials!',
          exception: e,
          description: e.response?.statusMessage,
        );
      }

      throw Failure.fromDioError(e);
    } catch (e) {
      throw Failure.unexpected(e);
    }
  }

  void _saveSessionID(String sessionId) async {
    await _localSessionDataSource.saveSessionId(sessionId);
  }

  @override
  Future<bool> isLogedIn() async {
    var sessionId = await _localSessionDataSource.getSessionId();

    return sessionId != null;
  }

  @override
  Future logoutUser() async {
    try {
      var sessionId = await _localSessionDataSource.getSessionId();
      var requestBody = {'session_id': sessionId};

      await _remoteAuthDataSource.deleteSession(requestBody);

      await _localSessionDataSource.deleteSessionId();

      Inject.reset();
    } on SocketException catch (e) {
      throw Failure.connection(e);
    } on DioError catch (e) {
      throw Failure.fromDioError(e);
    } catch (e) {
      throw Failure.unexpected(e);
    }
  }
}
