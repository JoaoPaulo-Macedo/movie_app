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

      /* if (AppConfigs.i!.environment == AppEnvironment.dev) return await getFromAssets();

      for (int listId = 1; listId <= amount; listId++) {
        ListEntity? list = await _dataSource(listId, 1);

        if (list != null) {
          lists.add(list);
        }
      }

      return lists; */
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

  /* Future<List<ListEntity>> getFromAssets() async {
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
  } */
}
