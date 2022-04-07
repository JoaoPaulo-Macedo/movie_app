import 'package:movie_app/core/domain/services/http_service.dart';
import 'package:movie_app/core/utils/api_utils.dart';
import 'package:movie_app/features/movie/data/datasource/movies_datasource.dart';
import 'package:movie_app/features/movie/data/dtos/movies_list_dto.dart';
import 'package:movie_app/features/movie/domain/entities/movies_list.dart';

class MoviesDatasourceImp implements MoviesDataSource {
  MoviesDatasourceImp(this._httpService);
  final HttpService _httpService;

  @override
  Future<MoviesListEntity?> call() async {
    try {
      var result = await _httpService.get(API.REQUEST_MOVIE_LIST);
      return MoviesListDTO.fromJson(result.data);
    } catch (e) {
      rethrow;
    }
  }
}
