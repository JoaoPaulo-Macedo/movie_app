abstract class LocalDataService {
  Future<String?> getString(String key, {required String? description});

  Future<List<String>?> getStringList(String key, {required String? description});

  Future<bool> setString(String key, String value, {required String? description});

  Future<bool> setStringList(String key, List<String> value, {required String? description});

  Future<bool> remove(String key, {required String? description});

  Future<bool> clear({required String? description});
}
