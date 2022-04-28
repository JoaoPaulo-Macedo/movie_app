abstract class HttpService {
  Future get(String path, {required String description});
  dynamic post(String path, {Map<String, dynamic>? queryParams, required String description});
  Future delete(String path, Map<String, dynamic>? queryParams, {required String description});
}
