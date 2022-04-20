import 'package:dio/dio.dart';
import 'package:movie_app/core/domain/services/http_service.dart';

class DioHttpServiceImp implements HttpService {
  DioHttpServiceImp() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.themoviedb.org/',
        headers: {
          'content-type': 'application/json;charset=utf-8',
          // our:
          // 'authorization':
          //     'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyMWZlMTMyZDk3NDBlNzAyZWFkYmZhN2M1Zjg0NzZmZiIsInN1YiI6IjYyNWVlNmFjZTYxZTZkMDA1MGY1ZjI4NyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.RBt_YcOAiaF14hGbdE6vUlipQ0NKH8Bn06Q-dbXQLbM',
          // other:
          // 'authorization':
          //     'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkODVhZjhlZDA0NTZhNWQyNzVmZmQxODI4YmJkYzY4NSIsInN1YiI6IjU5ODA1NjQ0YzNhMzY4MTA1NTAwZDRiNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.MJcPKVkaqXdI_Oblbk-VjBM8pWtTmKltfxZqyuLIU_U',
        },
      ),
    );
  }

  late Dio _dio;

  @override
  Future get(String path, {Map<String, dynamic>? queryParamaters}) async {
    return await _dio.get(path, queryParameters: queryParamaters);
  }

  @override
  post(String path, {Map<String, dynamic>? queryParamaters}) async {
    try {
      Response response = await _dio.post(path, data: queryParamaters);

      print(response.data);
      return response;
    } catch (e) {
      rethrow;
    }
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