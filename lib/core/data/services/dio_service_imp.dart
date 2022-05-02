import 'package:dio/dio.dart';
import 'package:movie_app/core/domain/services/http_service.dart';
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
          'authorization':
              'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyMWZlMTMyZDk3NDBlNzAyZWFkYmZhN2M1Zjg0NzZmZiIsInN1YiI6IjYyNWVlNmFjZTYxZTZkMDA1MGY1ZjI4NyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.RBt_YcOAiaF14hGbdE6vUlipQ0NKH8Bn06Q-dbXQLbM',
        },
      ),
    );

    if (AppConfigs.debug!) _dio.interceptors.add(CustomLogInterceptor());
  }

  late Dio _dio;

  @override
  get(String path, {required String description}) async {
    Debug.description(description);

    final Response response = await _dio.get(path);

    return response;
  }

  @override
  post(String path, {Map<String, dynamic>? queryParams, required String description}) async {
    try {
      Debug.description(description);

      Response response = await _dio.post(path, data: queryParams);

      return response;
    } catch (e) {
      Debug.log(e.toString());

      rethrow;
    }
  }

  @override
  delete(String path, Map<String, dynamic>? queryParams, {required String description}) async {
    Debug.description(description);

    Response response = await _dio.delete(path, queryParameters: queryParams);

    return response;
  }
}
