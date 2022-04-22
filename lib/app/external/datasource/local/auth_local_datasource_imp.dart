import 'package:get_it/get_it.dart';
import 'package:movie_app/app/data/datasource/auth_local_datasource.dart';
import 'package:movie_app/core/domain/services/local_data_service.dart';

class AuthenticationLocalDataSourceImp extends AuthenticationLocalDataSource {
  AuthenticationLocalDataSourceImp(this._service);

  final LocalDataService _service;

  final String _key = 'sessionId';

  @override
  Future<bool> saveSessionId(String sessionId) async {
    return await _service.setString(
      _key,
      sessionId,
      description: 'Set a session Id in cache',
    );
  }

  @override
  Future<String?> getSessionId() async {
    return await _service.getString(_key, description: 'Get a session Id from cache');
  }

  //TODO: change name to logout?
  @override
  Future<bool> deleteSessionId() async {
    bool success = await _service.clear(
      description: 'Clear all preferences and log out',
    );
    GetIt.instance.reset();

    return success;
  }
}
