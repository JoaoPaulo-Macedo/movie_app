import 'package:get_it/get_it.dart';
import 'package:movie_app/app/data/datasource/auth_local_datasource.dart';
import 'package:movie_app/core/domain/services/local_data_service.dart';

class AuthenticationLocalDataSourceImp extends AuthenticationLocalDataSource {
  AuthenticationLocalDataSourceImp(this._service);

  final LocalDataService _service;

  final String _key = 'sessionId';

  @override
  Future<bool> saveSessionId(String sessionId) async {
    return await _service.setString(_key, sessionId);
  }

  @override
  String? getSessionId() {
    return _service.getString(_key);
  }

  //TODO: change name to logout?
  @override
  Future<bool> deleteSessionId() async {
    bool success = await _service.clear();
    GetIt.instance.reset();

    return success;
  }
}
