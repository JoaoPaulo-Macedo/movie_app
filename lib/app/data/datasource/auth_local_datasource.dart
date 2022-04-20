abstract class AuthenticationLocalDataSource {
  void saveSessionId(String sessionId);
  Future<String?> getSessionId();
}
