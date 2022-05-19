import 'package:dio/dio.dart';
import 'package:movie_app/core/domain/services/http_service.dart';
import 'package:movie_app/core/utils/api_utils.dart';
import 'package:movie_app/core/utils/app_configs.dart';
import 'package:movie_app/core/data/interceptors/custom_log_interceptor.dart';
import 'package:movie_app/core/utils/debug.dart';

class DioHttpServiceImp implements HttpService {
  DioHttpServiceImp() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.themoviedb.org/',
        headers: {
          'content-type': 'application/json;charset=utf-8',
          'authorization': API.getBearer(),
        },
      ),
    );

    if (AppConfigs.i!.debug) _dio.interceptors.add(CustomLogInterceptor());
  }

  late Dio _dio;

  @override
  get(String path) async {
    final Response response = await _dio.get(path);

    return response;
  }

  @override
  post(String path, {Map<String, dynamic>? queryParams}) async {
    try {
      Response response = await _dio.post(path, data: queryParams);

      return response;
    } catch (e) {
      Debug.log(e.toString());

      rethrow;
    }
  }

  @override
  delete(String path, Map<String, dynamic>? queryParams) async {
    Response response = await _dio.delete(path, queryParameters: queryParams);

    return response;
  }
}
