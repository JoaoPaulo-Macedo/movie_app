import 'package:movie_app/app/data/datasource/local/session_id_datasource.dart';
import 'package:movie_app/core/domain/services/local_data_service.dart';

class SessionIdDataSourceImp extends SessionIdDataSource {
  SessionIdDataSourceImp(this._service);

  final LocalDataService _service;

  final String _key = 'sessionId';

  @override
  Future<bool> saveSessionId(String sessionId) async {
    return await _service.setString(
      _key,
      sessionId);
  }

  @override
  Future<String?> getSessionId() async {
    return await _service.getString(
      _key);
  }

  @override
  Future<bool> deleteSessionId() async {
    bool success = await _service.clear();

    return success;
  }
}
