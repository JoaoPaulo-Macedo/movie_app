import 'package:movie_app/app/data/datasource/auth_remote_datasource.dart';
import 'package:movie_app/app/data/datasource/auth_local_datasource.dart';
import 'package:movie_app/app/domain/entities/login_params_entity.dart';
import 'package:movie_app/app/domain/repositories/auth_repository.dart';
import 'package:movie_app/core/inject/inject.dart';

class AuthenticationRepositoryImp implements AuthenticationRepository {
  AuthenticationRepositoryImp(
    this._remoteAuthDataSource,
    this._localSessionDataSource,
  );

  final AuthenticationRemoteDataSource _remoteAuthDataSource;
  final SessionIdDataSource _localSessionDataSource;

  @override
  Future<bool> loginUser(LoginParamsEntity loginParams) async {
    var token = await _requestToken();

    try {
      Map<String, dynamic> params = loginParams.toJson();
      params.putIfAbsent('request_token', () => token);

      var validateWithLogin = await _remoteAuthDataSource.validateWithLogin(params);

      final sessionId = await _remoteAuthDataSource.createSession(
        validateWithLogin.toJson(),
      );
      await _localSessionDataSource.saveSessionId(sessionId);

      return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> _requestToken() async {
    try {
      final request = await _remoteAuthDataSource.getRequestToken();

      return request.requestToken;
    } catch (e) {
      rethrow;
    }
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
