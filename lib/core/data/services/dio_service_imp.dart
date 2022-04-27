// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:movie_app/core/domain/services/http_service.dart';
import 'package:movie_app/core/utils/app_configs.dart';

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
  Future get(String path, {required String? description}) async {
    try {
      final Response response = await _dio.get(path);

      if (debug) _log(response.data, path, description, true);

      return response;
    } catch (e) {
      if (debug) log(e.toString());
    }
  }

  @override
  post(
    String path, {
    Map<String, dynamic>? queryParams,
    required String? description,
  }) async {
    try {
      if (debug) _log(queryParams, path, description);

      Response response = await _dio.post(path, data: queryParams);

      if (debug) _log(response.data, '', description, true);

      return response;
    } catch (e) {
      if (debug) log(e.toString());
    }
  }

  void _log(
    dynamic data, [
    String? path,
    String? description,
    bool response = false,
  ]) {
    final String logData = data.toString();
    final int length = data.toString().length;

    log(
      logData.substring(
        0,
        length < AppConfigs.debugMaxChars ? length : AppConfigs.debugMaxChars,
      ),
      name: 'Remote${response ? ' - Response' : ''}: $description: $path',
    );
  }
}

/* 
curl -X POST 'https://api.themoviedb.org/3/authentication/token/validate_with_login?api_key=21fe132d9740e702eadbfa7c5f8476ff'
  -H 'Content-Type: application/json'
  -d {
    'userName': '...', 
    'password': '...', 
    'request_token': '7bd237790c0d0207f9c6bd68e86690035dc73029'
  }
*/