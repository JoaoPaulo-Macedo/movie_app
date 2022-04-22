import 'dart:developer';

import 'package:movie_app/core/domain/services/local_data_service.dart';
import 'package:movie_app/core/utils/app_configs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesServiceImp extends LocalDataService {
  PreferencesServiceImp() {
    init();
  }

  static SharedPreferences? _prefs;
  final bool debug = AppConfigs.debug!;

  init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  @override
  Future<String?> getString(String key, {String? description}) async {
    if (_prefs == null) await init();

    String? data = _prefs!.getString(key);

    if (debug) _log(data, description);

    return data;
  }

  @override
  Future<List<String>?> getStringList(String key, {String? description}) async {
    if (_prefs == null) await init();

    List<String>? data = _prefs!.getStringList(key);

    if (debug) _log(data, description);

    return data;
  }

  @override
  Future<bool> setString(String key, String value, {String? description}) async {
    if (_prefs == null) await init();

    if (debug) _log(value, description);

    return await _prefs!.setString(key, value);
  }

  @override
  Future<bool> setStringList(
    String key,
    List<String> value, {
    String? description,
  }) async {
    if (_prefs == null) await init();

    if (debug) _log(value, description);

    return await _prefs!.setStringList(key, value);
  }

  @override
  Future<bool> remove(String key, {String? description}) async {
    if (_prefs == null) await init();

    if (debug) _log('SharedPreferences\' remove()', description);

    return await _prefs!.remove(key);
  }

  @override
  Future<bool> clear({String? description}) async {
    if (_prefs == null) await init();

    if (debug) _log('SharedPreferences\' clear()', description);

    return await _prefs!.clear();
  }

  void _log(dynamic data, [String? description]) {
    final String logData = data.toString();
    final int length = data.toString().length;

    log(
      logData.substring(
          0, length < AppConfigs.debugMaxChars ? length : AppConfigs.debugMaxChars),
      name: 'Local - $description:',
    );
  }
}
