import 'package:get_it/get_it.dart';
import 'package:movie_app/app/data/datasource/auth_local_datasource.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationLocalDataSourceImp extends AuthenticationLocalDataSource {
  final String _key = 'sessionId';

  @override
  Future<void> saveSessionId(String sessionId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, sessionId);
  }

  @override
  Future<String?> getSessionId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_key);
  }

  @override
  Future<void> deleteSessionId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    GetIt.instance.reset();
  }
}
