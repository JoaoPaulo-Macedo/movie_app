import 'package:movie_app/core/domain/services/local_data_service.dart';
import 'package:movie_app/core/utils/app_configs.dart';
import 'package:movie_app/core/utils/debug.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesServiceImp extends LocalDataService {
  static SharedPreferences? _prefs;
  final bool debug = AppConfigs.i!.debug;

  init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  @override
  Future<String?> getString(String key, {required String description}) async {
    if (_prefs == null) await init();

    String? data = _prefs!.getString(key);

    Debug.log(data, description: description);

    return data;
  }

  @override
  Future<List<String>?> getStringList(String key, {required String description}) async {
    if (_prefs == null) await init();

    List<String>? data = _prefs!.getStringList(key);

    Debug.log(data, description: description);

    return data;
  }

  @override
  Future<bool> setString(String key, String value, {required String description}) async {
    if (_prefs == null) await init();

    Debug.log(value, description: description);

    return await _prefs!.setString(key, value);
  }

  @override
  Future<bool> setStringList(String key, List<String> value, {required String description}) async {
    if (_prefs == null) await init();

    Debug.log(value, description: description);

    return await _prefs!.setStringList(key, value);
  }

  @override
  Future<bool> remove(String key, {required String description}) async {
    if (_prefs == null) await init();

    Debug.log('Preferences\' remove()', description: description);

    return await _prefs!.remove(key);
  }

  @override
  Future<bool> clear({required String description}) async {
    if (_prefs == null) await init();

    Debug.log('Preferences\' clear()', description: description);

    return await _prefs!.clear();
  }
}
