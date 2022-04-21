abstract class AuthenticationLocalDataSource {
  Future<void> saveSessionId(String sessionId);
  Future<String?> getSessionId();
  Future<void> deleteSessionId();
}
