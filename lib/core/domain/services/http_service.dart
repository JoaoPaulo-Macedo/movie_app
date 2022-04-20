abstract class HttpService {
  Future get(String path, {Map<String, dynamic>? queryParamaters});
  dynamic post(String path, {Map<String, dynamic>? queryParamaters});
}
