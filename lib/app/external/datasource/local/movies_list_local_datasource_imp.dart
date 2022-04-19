import 'dart:convert';
import 'package:movie_app/app/data/datasource/movies_list_datasource.dart';
import 'package:movie_app/app/data/datasource/movies_list_local_datasource.dart';
import 'package:movie_app/app/data/dtos/movies_list_dto.dart';
import 'package:movie_app/app/domain/entities/movies_list_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MoviesListLocalDataSourceDecoratorImp extends MoviesListLocalDataSourceDecorator {
  MoviesListLocalDataSourceDecoratorImp(
    MoviesListDataSource datasource,
  ) : super(datasource);

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
    var prefs = await SharedPreferences.getInstance();

    String moviesJsonString = jsonEncode(movies.toJson());

    prefs.setString(_key, moviesJsonString);
  }

  Future<MoviesListEntity> _getInCache() async {
    var prefs = await SharedPreferences.getInstance();

    var cachedMoviesJson = jsonDecode(prefs.getString(_key) ?? '');

    return MoviesListDTO.fromJson(cachedMoviesJson);
  }
}
