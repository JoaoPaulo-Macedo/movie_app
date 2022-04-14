import 'package:movie_app/core/domain/services/http_service.dart';
import 'package:movie_app/core/utils/api_utils.dart';
import 'package:movie_app/data/datasource/movies_list_datasource.dart';
import 'package:movie_app/data/dtos/movies_list_dto.dart';
import 'package:movie_app/domain/entities/movies_list_entity.dart';

class MoviesListDatasourceImp implements MoviesListDataSource {
  MoviesListDatasourceImp(this._httpService);
  final HttpService _httpService;

  @override
  Future<MoviesListEntity?> call(int list, int page) async {
    try {
      var result = await _httpService.get(API.requestMoviesList(list, page));
      return MoviesListDTO.fromJson(result.data);
    } catch (e) {
      rethrow;
    }
  }
}
