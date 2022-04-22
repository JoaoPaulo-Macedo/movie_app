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
        return _getInCache();
      } catch (e) {
        rethrow;
      }
    }
  }

  Future<bool> _saveInCache(MoviesListEntity movies) async {
    String moviesJsonString = jsonEncode(movies.toJson());

    return await _service.setString(
      _key,
      moviesJsonString,
      description: 'Set a movies list in cache',
    );
  }

  Future<MoviesListEntity?> _getInCache() async {
    var movie = await _service.getString(_key, description: 'Get a movie list from cache');
    if (movie == null) return null;

    var json = jsonDecode(movie);

    return MoviesListDTO.fromJson(json);
  }
}
