import 'package:movie_app/app/data/datasource/movies_list_datasource.dart';
import 'package:movie_app/app/domain/entities/movies_list_entity.dart';
import 'package:movie_app/app/domain/repositories/movies_list_repository.dart';

class MoviesListRepositoryImp implements MoviesListRepository {
  MoviesListRepositoryImp(this._dataSource);

  final MoviesListDataSource _dataSource;

  @override
  Future<MoviesListEntity?> call(int list, int page) async {
    return await _dataSource(list, page);
  }

  /*
  
curl --request GET --url 'https://api.themoviedb.org/4/list/1?page=1' --header 'authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkODVhZjhlZDA0NTZhNWQyNzVmZmQxODI4YmJkYzY4NSIsInN1YiI6IjU5ODA1NjQ0YzNhMzY4MTA1NTAwZDRiNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.MJcPKVkaqXdI_Oblbk-VjBM8pWtTmKltfxZqyuLIU_U' --header 'content-type: application/json;charset=utf-8' --data '{}'
curl --request GET --url 'https://api.themoviedb.org/4/list/1?page=1' --header 'authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyMWZlMTMyZDk3NDBlNzAyZWFkYmZhN2M1Zjg0NzZmZiIsInN1YiI6IjYyNWVlNmFjZTYxZTZkMDA1MGY1ZjI4NyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.RBt_YcOAiaF14hGbdE6vUlipQ0NKH8Bn06Q-dbXQLbM' --header 'content-type: application/json;charset=utf-8' --data '{}'
  
  */
}