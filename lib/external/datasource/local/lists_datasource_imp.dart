import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:movie_app/data/datasource/lists_datasource.dart';
import 'package:movie_app/data/dtos/list_identifier_dto.dart';
import 'package:movie_app/domain/entities/list_identifier_entity.dart';

class ListsDataSourceImp extends ListsDataSource {
  @override
  Future<List<ListIdentifierEntity>> call() async {
    List<ListIdentifierEntity> lists = [];

    List values = jsonDecode(await rootBundle.loadString('assets/lists.json'));

    for (var e in values) {
      lists.add(ListIdentifierDTO.fromJson(e));
    }

    return lists;
  }
}
