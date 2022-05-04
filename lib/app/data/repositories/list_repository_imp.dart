import 'dart:io';

import 'package:dio/dio.dart';
import 'package:movie_app/app/data/datasource/local/assets_datasource.dart';
import 'package:movie_app/app/data/datasource/remote/movies_list_datasource.dart';
import 'package:movie_app/app/domain/entities/movies_list_entity.dart';
import 'package:movie_app/app/domain/repositories/list_repository.dart';
import 'package:movie_app/core/utils/failure.dart';

class ListRepositoryImp extends ListRepository {
  ListRepositoryImp(this._dataSource, this._assetsDataSource);

  final MoviesListDataSource _dataSource;
  final AssetsDataSource _assetsDataSource;
  final List<ListEntity> lists = [];

  @override
  Future<List<ListEntity>> getAllLists() async {
    try {
      if (lists.isNotEmpty) return lists;

      return await _assetsDataSource.getLists();
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
      return await _dataSource(listId, page);
    } on SocketException catch (e) {
      throw Failure.connection(e);
    } on DioError catch (e) {
      throw Failure.fromDioError(e);
    } catch (e) {
      throw Failure.unexpected(e);
    }
  }
}
