import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:movie_app/app/data/datasource/remote/movies_list_datasource.dart';
import 'package:movie_app/app/data/dtos/list_dto.dart';
import 'package:movie_app/app/domain/entities/movies_list_entity.dart';
import 'package:movie_app/app/domain/repositories/list_repository.dart';
import 'package:movie_app/core/utils/app_configs.dart';
import 'package:movie_app/core/utils/debug.dart';
import 'package:movie_app/core/utils/failure.dart';

class ListRepositoryImp extends ListRepository {
  ListRepositoryImp(this._dataSource);

  final MoviesListDataSource _dataSource;
  final List<ListEntity> lists = [];

  @override
  Future<List<ListEntity>> getManyLists(int amount) async {
    try {
      if (lists.isNotEmpty) return lists;

      if (AppConfigs.i!.environment == AppEnvironment.dev) return await getFromAssets();

      for (int listId = 1; listId <= amount; listId++) {
        ListEntity? list = await _dataSource(listId, 1);

        if (list != null) {
          lists.add(list);
        }
      }

      return lists;
    } on SocketException catch (e) {
      throw Failure.connection(e);
    } on DioError catch (e) {
      throw Failure.fromDioError(e);
    } catch (e) {
      throw Failure.unexpected(e);
    }
  }

  @override
  Future<ListEntity?> getList(int listId, int page) async {
    try {
      return await _dataSource(listId, 1);
    } on SocketException catch (e) {
      throw Failure.connection(e);
    } on DioError catch (e) {
      throw Failure.fromDioError(e);
    } catch (e) {
      throw Failure.unexpected(e);
    }
  }

  Future<List<ListEntity>> getFromAssets() async {
    List jsonList = jsonDecode(await rootBundle.loadString('assets/lists.json'));

    Debug.log(
      jsonList.toString(),
      description: 'Lists from assets to avoid API overload',
      debugSource: DebugSource.mock,
    );

    for (var json in jsonList) {
      lists.add(ListDTO.fromJson(json));
    }

    return lists;
  }
}
