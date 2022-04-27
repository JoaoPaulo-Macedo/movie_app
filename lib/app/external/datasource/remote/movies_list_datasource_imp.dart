import 'package:dio/dio.dart';
import 'package:movie_app/core/domain/services/http_service.dart';
import 'package:movie_app/core/utils/api_utils.dart';
import 'package:movie_app/app/data/datasource/movies_list_datasource.dart';
import 'package:movie_app/app/data/dtos/movies_list_dto.dart';
import 'package:movie_app/app/domain/entities/movies_list_entity.dart';

class MoviesListDataSourceImp implements MoviesListDataSource {
  MoviesListDataSourceImp(this._httpService);

  final HttpService _httpService;

  @override
  Future<MoviesListEntity?> call(int list, int page) async {
    var result = await _httpService.get(
      API.requestMoviesList(list, page),
      description: 'Get a list of movies according to pagination',
    );
    return MoviesListDTO.fromJson(result.data);
  }
}
