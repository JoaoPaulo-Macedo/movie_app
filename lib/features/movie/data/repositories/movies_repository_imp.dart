import 'package:movie_app/features/movie/data/datasource/movies_datasource.dart';
import 'package:movie_app/features/movie/domain/entities/movies_list.dart';
import 'package:movie_app/features/movie/domain/repositories/movies_repository.dart';

class MoviesRepositoryImp implements MoviesRepository {
  MoviesRepositoryImp(this._dataSource);

  final MoviesDataSource _dataSource;

  @override
  Future<MoviesListEntity?> call() async {
    return await _dataSource();
  }

  /*
  
curl --request GET --url 'https://api.themoviedb.org/4/list/1?page=1' --header 'authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkODVhZjhlZDA0NTZhNWQyNzVmZmQxODI4YmJkYzY4NSIsInN1YiI6IjU5ODA1NjQ0YzNhMzY4MTA1NTAwZDRiNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.MJcPKVkaqXdI_Oblbk-VjBM8pWtTmKltfxZqyuLIU_U' --header 'content-type: application/json;charset=utf-8' --data '{}'
  
  */
}

// Data can access domain layer and itself, but not external layers.