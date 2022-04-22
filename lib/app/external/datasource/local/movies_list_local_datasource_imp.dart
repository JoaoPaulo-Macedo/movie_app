import 'dart:convert';
import 'package:movie_app/app/data/datasource/movies_list_datasource.dart';
import 'package:movie_app/app/data/datasource/movies_list_local_datasource.dart';
import 'package:movie_app/app/data/dtos/movies_list_dto.dart';
import 'package:movie_app/app/domain/entities/movies_list_entity.dart';
import 'package:movie_app/core/domain/services/local_data_service.dart';

class MoviesListLocalDataSourceDecoratorImp
    extends MoviesListLocalDataSourceDecorator {
  MoviesListLocalDataSourceDecoratorImp(
    MoviesListDataSource datasource,
    this._service,
  ) : super(datasource);

  final LocalDataService _service;
  final _key = 'movies_cache';

  @override
  Future<MoviesListEntity?> call(int list, int page) async {
    try {
      MoviesListEntity? movies = await super(list, page);
      if (movies != null) _saveInCache(movies);

      return movies;
    } catch (e) {
      try {
        return await _getInCache();
      } catch (e) {
        rethrow;
      }
    }
  }

  _saveInCache(MoviesListEntity movies) async {
    String moviesJsonString = jsonEncode(movies.toJson());

    _service.setString(_key, moviesJsonString);
  }

  MoviesListEntity _getInCache() {
    var cachedMoviesJson = jsonDecode(_service.getString(_key) ?? '');

    return MoviesListDTO.fromJson(cachedMoviesJson);
  }
}
