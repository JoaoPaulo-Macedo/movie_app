import 'dart:io';

import 'package:dio/dio.dart';
import 'package:movie_app/app/data/datasource/lists_cache_datasource.dart';
import 'package:movie_app/app/data/datasource/movies_list_datasource.dart';
import 'package:movie_app/app/data/dtos/list_identifier_dto.dart';
import 'package:movie_app/app/data/dtos/list_dto.dart';
import 'package:movie_app/app/domain/entities/list_identifier_entity.dart';
import 'package:movie_app/app/domain/entities/movies_list_entity.dart';
import 'package:movie_app/app/domain/repositories/lists_repository.dart';
import 'package:movie_app/core/utils/failure.dart';

class ListRepositoryImp extends ListRepository {
  ListRepositoryImp(this._dataSource /* , this._listsCache */);

  final MoviesListDataSource _dataSource;
  // final ListsCacheDataSource _listsCache;
  final List<ListEntity> lists = [];

  @override
  Future<List<ListEntity>> getManyLists(int amount) async {
    try {
      if (lists.isNotEmpty) return lists;
      // List<ListIdentifierEntity> listOfLists = await _listsCache.getListsFromCache();
      // if (listOfLists.isNotEmpty) return listOfLists;

      for (int listId = 1; listId <= amount; listId++) {
        ListEntity? list = await _dataSource(listId, 1);

        if (list != null) {
          lists.add(list);
        }
      }

      // saveToCache(listOfLists);
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
  Future<ListEntity> getList(int listId, int page) async {
    try {
      return lists.firstWhere((e) => e.id == listId);
    } on SocketException catch (e) {
      throw Failure.connection(e);
    } on DioError catch (e) {
      throw Failure.fromDioError(e);
    } catch (e) {
      throw Failure.unexpected(e);
    }
  }

  // saveToCache(List<ListIdentifierEntity> lists) {
  //   _listsCache.saveListsToCache(lists);
  // }
}
