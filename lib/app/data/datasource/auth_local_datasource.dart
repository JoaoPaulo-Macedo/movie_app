abstract class SessionIdDataSource {
  Future<bool> saveSessionId(String sessionId);
  Future<String?> getSessionId();
  Future<bool> deleteSessionId();
}
