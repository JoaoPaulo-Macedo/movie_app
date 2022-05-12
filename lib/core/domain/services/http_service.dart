abstract class HttpService {
  Future get(String path);
  dynamic post(String path, {Map<String, dynamic>? queryParams});
  Future delete(String path, Map<String, dynamic>? queryParams);
}
