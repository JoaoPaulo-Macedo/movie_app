import 'package:dio/dio.dart';
import 'package:movie_app/app/data/datasource/remote/favorites_datasource.dart';
import 'package:movie_app/app/data/dtos/list_dto.dart';
import 'package:movie_app/app/domain/entities/movie_entity.dart';
import 'package:movie_app/app/domain/entities/movies_list_entity.dart';
import 'package:movie_app/core/domain/services/http_service.dart';
import 'package:movie_app/core/utils/api_utils.dart';

class FavoritesDataSourceImp extends FavoritesDataSource {
  FavoritesDataSourceImp(this._service);

  final HttpService _service;

  @override
  Future<ListEntity> getFavorites(int page, int accountId, String sessionId) async {
    var path = API.requestFavoritesList(
      page: page.toString(),
      accountId: accountId.toString(),
      sessionId: sessionId,
    );

    final Response response = await _service.get(path);

    return ListDTO.fromJson(response.data);
  }

  @override
  Future<bool> toggleFavorite(
      MovieEntity movie, bool favorite, int accountId, String sessionId) async {
    var path = API.toggleFavorite(
      accountId: accountId.toString(),
      sessionId: sessionId,
    );

    final Response response = await _service.post(path, queryParams: {
      'media_type': 'movie',
      'media_id': movie.id,
      'favorite': favorite,
    });

    if (response.statusCode == 200) return true;
    return false;
  }
}
