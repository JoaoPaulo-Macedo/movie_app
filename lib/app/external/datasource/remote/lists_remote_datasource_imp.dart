import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:movie_app/core/domain/services/http_service.dart';
import 'package:movie_app/core/utils/api_utils.dart';
import 'package:movie_app/app/data/datasource/lists_remote_datasource.dart';
import 'package:movie_app/app/data/dtos/list_identifier_dto.dart';
import 'package:movie_app/app/domain/entities/list_identifier_entity.dart';

class ListsRemoteDataSourceImp extends ListsRemoteDataSource {
  ListsRemoteDataSourceImp(this._httpService);

  final HttpService _httpService;

  @override
  Future<List<ListIdentifierEntity>> call(int amount) async {
    List<ListIdentifierEntity> lists = [];
    List<String> stringList = [];

    for (int list = 1; list <= amount; list++) {
      Response result = await _httpService.get(API.requestMoviesList(list, 1));

      if (result.data['total_results'] == 0) break;

      stringList.add(jsonEncode(result.data));
    }

    for (var e in stringList) {
      lists.add(ListIdentifierDTO.fromJson(jsonDecode(e)));
    }

    return lists;
  }
}
