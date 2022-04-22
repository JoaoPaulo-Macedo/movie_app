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
          // our:
          'authorization':
              'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyMWZlMTMyZDk3NDBlNzAyZWFkYmZhN2M1Zjg0NzZmZiIsInN1YiI6IjYyNWVlNmFjZTYxZTZkMDA1MGY1ZjI4NyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.RBt_YcOAiaF14hGbdE6vUlipQ0NKH8Bn06Q-dbXQLbM',
          // other:
          // 'authorization':
          //     'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkODVhZjhlZDA0NTZhNWQyNzVmZmQxODI4YmJkYzY4NSIsInN1YiI6IjU5ODA1NjQ0YzNhMzY4MTA1NTAwZDRiNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.MJcPKVkaqXdI_Oblbk-VjBM8pWtTmKltfxZqyuLIU_U',
        },
      ),
    );
  }

  late Dio _dio;
  final bool debug = AppConfigs.environment == Environment.dev;

  @override
  Future get(String path, {/* Map<String, dynamic>? queryParams,  */String? description}) async {
    final Response response = await _dio.get(path/* , queryParameters: queryParams */);

    if (debug) _log(response.data, '${_dio.options.baseUrl}$path', description);

    return response;
  }

  @override
  post(String path, {Map<String, dynamic>? queryParams, String? description}) async {
    try {
      if (debug) _log(queryParams, '${_dio.options.baseUrl}$path', description);

      Response response = await _dio.post(path, data: queryParams);

      if (debug) _log(response.data, '', description);

      return response;
    } catch (e) {
      rethrow;
    }
  }

  void _log(dynamic message, [String? path, String? description]) {
    final String logMessage = message.toString();
    final int length = message.toString().length;

    log(
      logMessage.substring(0, length < 150 ? length : 150),
      name: '$description: $path',
      // stackTrace: StackTrace.current,
    );
  }
}

/* 
curl -X POST 'https://api.themoviedb.org/3/authentication/token/validate_with_login?api_key=21fe132d9740e702eadbfa7c5f8476ff'
   -H 'Content-Type: application/json'
   -d {
   'userName': 'macedo.722', 
   'password': 'ninaekiara', 
   'request_token': '7bd237790c0d0207f9c6bd68e86690035dc73029'
   }
*/