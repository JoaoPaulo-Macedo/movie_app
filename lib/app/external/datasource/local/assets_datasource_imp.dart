import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:movie_app/app/data/datasource/local/assets_datasource.dart';
import 'package:movie_app/app/data/dtos/list_dto.dart';
import 'package:movie_app/app/domain/entities/movies_list_entity.dart';
import 'package:movie_app/core/utils/debug.dart';

class AssetsDataSourceImp extends AssetsDataSource {
  @override
  Future<List<ListEntity>> getLists() async {
    List<ListEntity> lists = [];
    List jsonList = jsonDecode(await rootBundle.loadString('assets/lists.json'));

    Debug.log(
      jsonList.toString(),
      description: 'Lists from assets',
    );

    for (var json in jsonList) {
      lists.add(ListDTO.fromJson(json));
    }

    return lists;
  }
}
