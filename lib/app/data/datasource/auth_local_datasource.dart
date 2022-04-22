abstract class AuthenticationLocalDataSource {
  Future<bool> saveSessionId(String sessionId);
  String? getSessionId();
  Future<bool> deleteSessionId();
}
