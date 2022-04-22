abstract class LocalDataService {
  Future<String?> getString(String key, {String? description});

  Future<List<String>?> getStringList(String key, {String? description});

  Future<bool> setString(String key, String value, {String? description});

  Future<bool> setStringList(String key, List<String> value, {String? description});

  Future<bool> remove(String key, {String? description});

  Future<bool> clear({String? description});
}
