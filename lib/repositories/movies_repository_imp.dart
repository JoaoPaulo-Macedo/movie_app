import 'package:movie_app/services/dio_service.dart';

import '../models/movies_list.dart';
import '../utils/api_utils.dart';
import 'movies_repository.dart';

class MoviesRepositoryImp implements MoviesRepository {
  MoviesRepositoryImp(this._dioService);

  final DioService _dioService;

  @override
  Future<MoviesList> getMovies() async {
    var result = await _dioService.getDio().get(API.REQUEST_MOVIE_LIST);

    return MoviesList.fromJson(result.data);
  }

  /*
  
curl --request GET --url 'https://api.themoviedb.org/4/list/1?page=1' --header 'authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkODVhZjhlZDA0NTZhNWQyNzVmZmQxODI4YmJkYzY4NSIsInN1YiI6IjU5ODA1NjQ0YzNhMzY4MTA1NTAwZDRiNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.MJcPKVkaqXdI_Oblbk-VjBM8pWtTmKltfxZqyuLIU_U' --header 'content-type: application/json;charset=utf-8' --data '{}'
  
  */
}
