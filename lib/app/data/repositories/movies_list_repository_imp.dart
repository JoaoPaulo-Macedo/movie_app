import 'dart:io';

import 'package:dio/dio.dart';
import 'package:movie_app/app/data/datasource/movies_list_datasource.dart';
import 'package:movie_app/app/domain/entities/movies_list_entity.dart';
import 'package:movie_app/app/domain/repositories/movies_list_repository.dart';
import 'package:movie_app/core/utils/failure.dart';

class MoviesListRepositoryImp implements MoviesListRepository {
  MoviesListRepositoryImp(this._dataSource);

  final MoviesListDataSource _dataSource;

  @override
  Future<MoviesListEntity?> call(int list, int page) async {
    try {
      return await _dataSource(list, page);
    } on SocketException catch (e) {
      throw Failure.connection(e);
    } on DioError catch (e) {
      throw Failure.fromDioError(e);
    } catch (e) {
      throw Failure.unexpected(e);
    }
  }
}
