import 'dart:developer';

import 'package:movie_app/core/domain/services/local_data_service.dart';
import 'package:movie_app/core/utils/app_configs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesServiceImp extends LocalDataService {
  PreferencesServiceImp(this._prefs);

  final SharedPreferences _prefs;
  final bool debug = AppConfigs.environment == Environment.dev;

  @override
  String? getString(String key, {required String description}) {
    return _prefs.getString(key);
  }

  @override
  List<String>? getStringList(String key, {required String description}) {
    return _prefs.getStringList(key);
  }

  @override
  Future<bool> setString(String key, String value, {required String description}) async {
    return await _prefs.setString(key, value);
  }

  @override
  Future<bool> setStringList(String key, List<String> value, {required String description}) async {
    return await _prefs.setStringList(key, value);
  }

  @override
  Future<bool> remove(String key, {required String description}) async {
    return await _prefs.remove(key);
  }

  @override
  Future<bool> clear({required String description}) async {
    return await _prefs.clear();
  }

  void _log(dynamic message, [String? path, String? description]) {
    final String logMessage = message.toString();
    final int length = message.toString().length;

    log(
      logMessage.substring(0, length < 150 ? length : 150),
      name: '$description: $path',
      // stackTrace: StackTrace.current,
    );
  }
}
