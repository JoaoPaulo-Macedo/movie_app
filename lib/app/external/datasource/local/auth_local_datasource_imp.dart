import 'package:movie_app/app/data/datasource/auth_local_datasource.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationLocalDataSourceImp extends AuthenticationLocalDataSource {
  final String _key = 'sessionId';

  @override
  saveSessionId(String sessionId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_key, sessionId);
  }
}