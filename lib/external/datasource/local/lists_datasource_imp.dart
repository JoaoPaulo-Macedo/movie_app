import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:movie_app/core/domain/services/http_service.dart';
import 'package:movie_app/core/utils/api_utils.dart';
import 'package:movie_app/data/datasource/lists_datasource.dart';
import 'package:movie_app/data/dtos/list_identifier_dto.dart';
import 'package:movie_app/domain/entities/list_identifier_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListsDataSourceImp extends ListsDataSource {
  ListsDataSourceImp(this._httpService);

  final HttpService _httpService;
  final _key = 'lists';

  @override
  Future<List<ListIdentifierEntity>> call(int amount) async {
    // List values = jsonDecode(await rootBundle.loadString('assets/lists.json'));
    final prefs = await SharedPreferences.getInstance();
    List<String> stringList = prefs.getStringList(_key) ?? [];
    List<ListIdentifierEntity> lists = [];

    if (stringList.isEmpty) stringList = await _getFromSource(amount);

    _saveToCache(stringList);

    for (var e in stringList) {
      lists.add(ListIdentifierDTO.fromJson(jsonDecode(e)));
    }

    return lists;
  }

  Future<List<String>> _getFromSource(int amount) async {
    print('OLOKI');
    List<String> lists = [];

    for (int list = 1; list <= amount; list++) {
      Response result = await _httpService.get(API.requestMoviesList(list, 1));

      lists.add(jsonEncode(result.data));
    }

    return lists;
  }

  void _saveToCache(List<String> lists) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList(_key, lists);
  }
}
