import 'package:dio/dio.dart';
import 'package:movie_app/core/domain/services/http_service.dart';
import 'package:movie_app/core/utils/app_configs.dart';
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
  }

  late Dio _dio;
  final bool debug = AppConfigs.debug!;

  @override
  get(String path, {required String description}) async {
    try {
      final Response response = await _dio.get(path);

      Debug.log(response.data, path: path, description: description, response: true);

      return response;
    } catch (e) {
      Debug.log(e.toString());

      rethrow;
    }
  }

  @override
  post(String path, {Map<String, dynamic>? queryParams, required String description}) async {
    try {
      Debug.log(queryParams, path: path, description: description);

      Response response = await _dio.post(path, data: queryParams);

      Debug.log(response.data, description: description, response: true);

      return response;
    } catch (e) {
      Debug.log(e.toString());

      rethrow;
    }
  }

  @override
  delete(String path, Map<String, dynamic>? queryParams, {required String description}) async {
    try {
      Debug.log(queryParams, path: path, description: description);

      Response response = await _dio.delete(path, queryParameters: queryParams);

      Debug.log(response.data, description: description, response: true);

    } catch (e) {
      Debug.log(e.toString());

      rethrow;
    }
  }
}