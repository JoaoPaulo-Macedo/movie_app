import 'package:movie_app/app/data/datasource/auth_local_datasource.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationLocalDataSourceImp extends AuthenticationLocalDataSource {
  final String _key = 'sessionId';

  @override
  void saveSessionId(String sessionId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_key, sessionId);
  }

  @override
  Future<String?> getSessionId() async {
    return '01347c6d5e30edc15b253ba5a0e9eaf1b8920590';
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // return prefs.getString(_key);
  }
}
