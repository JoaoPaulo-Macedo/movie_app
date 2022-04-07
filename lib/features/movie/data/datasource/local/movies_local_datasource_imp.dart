import 'dart:convert';
import 'package:movie_app/features/movie/data/datasource/local/movies_local_datasource.dart';
import 'package:movie_app/features/movie/data/datasource/movies_datasource.dart';
import 'package:movie_app/features/movie/data/dtos/movies_list_dto.dart';
import 'package:movie_app/features/movie/domain/entities/movies_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MovicesLocalDataSourceDecoratorImp extends MoviesLocalDataSourceDecorator {
  MovicesLocalDataSourceDecoratorImp(
    MoviesDataSource datasource,
  ) : super(datasource);

  final _key = 'movies_cache';

  @override
  Future<MoviesListEntity?> call() async {
    try {
      MoviesListEntity? movies = await super();
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
