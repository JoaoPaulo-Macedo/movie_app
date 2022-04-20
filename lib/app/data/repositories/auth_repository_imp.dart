import 'package:movie_app/app/data/datasource/auth_remote_datasource.dart';
import 'package:movie_app/app/data/datasource/auth_local_datasource.dart';
import 'package:movie_app/app/data/dtos/request_token_dto.dart';
import 'package:movie_app/app/domain/entities/login_params_entity.dart';
import 'package:movie_app/app/domain/repositories/auth_repository.dart';

class AuthenticationRepositoryImp implements AuthenticationRepository {
  AuthenticationRepositoryImp(this._dataSource, this._localDataSource);

  final AuthenticationRemoteDataSource _dataSource;
  final AuthenticationLocalDataSource _localDataSource;

  @override
    Future<bool> loginUser(LoginParamsEntity loginParams) async {
    try {
      final request = await _dataSource.getRequestToken();
      
      final token = request.requestToken;

      RequestTokenDTO validateWithLogin;

      try {
        Map<String, dynamic> params = loginParams.toJson();
        params.putIfAbsent('request_token', () => token);

        validateWithLogin = await _dataSource.validateWithLogin(params);

        final sessionId =
            await _dataSource.createSession(validateWithLogin.toJson());

        if (sessionId != null) {
          await _localDataSource.saveSessionId(sessionId);
        }

        print(sessionId);
      } catch (e) {
        rethrow;
      }

      // return true;
      return true;
    } catch (e) {
      rethrow;
    }
  }

  @override
  logoutUser() {
    // TODO: implement logoutUser
    throw UnimplementedError();
  }
}
