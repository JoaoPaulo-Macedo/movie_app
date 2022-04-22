abstract class HttpService {
  Future get(String path, {/* Map<String, dynamic>? queryParams,  */required String? description});
  dynamic post(String path, {Map<String, dynamic>? queryParams, required String? description});
}
