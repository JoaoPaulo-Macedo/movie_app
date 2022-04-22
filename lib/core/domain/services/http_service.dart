abstract class HttpService {
  Future get(String path, {/* Map<String, dynamic>? queryParams,  */String? description});
  dynamic post(String path, {Map<String, dynamic>? queryParams, String? description});
}
