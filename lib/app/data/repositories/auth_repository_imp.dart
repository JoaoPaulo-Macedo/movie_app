import 'package:movie_app/app/data/datasource/auth_remote_datasource.dart';
import 'package:movie_app/app/data/datasource/auth_local_datasource.dart';
import 'package:movie_app/app/domain/entities/login_params_entity.dart';
import 'package:movie_app/app/domain/repositories/auth_repository.dart';

class AuthenticationRepositoryImp implements AuthenticationRepository {
  AuthenticationRepositoryImp(this._dataSource, this._localDataSource);

  final AuthenticationRemoteDataSource _dataSource;
  final AuthenticationLocalDataSource _localDataSource;

  @override
  Future<bool> loginUser(LoginParamsEntity loginParams) async {
    var token = await _requestToken();

    try {
      Map<String, dynamic> params = loginParams.toJson();
      params.putIfAbsent('request_token', () => token);

      var validateWithLogin = await _dataSource.validateWithLogin(params);

      final sessionId = await _dataSource.createSession(validateWithLogin.toJson());
      await _localDataSource.saveSessionId(sessionId);

      print(sessionId);
      return true;
    } catch (e) {
      rethrow;
    }
  }

  Future<String> _requestToken() async {
    try {
      final request = await _dataSource.getRequestToken();

      return request.requestToken;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> isLogedIn() async {
    var sessionId = await _localDataSource.getSessionId();

    return sessionId != null;
  }

  @override
  logoutUser() async {
    await _localDataSource.deleteSessionId();
  }
}
