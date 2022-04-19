import 'package:movie_app/app/data/datasource/movies_list_datasource.dart';
import 'package:movie_app/app/domain/entities/movies_list_entity.dart';

class MoviesListLocalDataSourceDecorator implements MoviesListDataSource {
  MoviesListLocalDataSourceDecorator(this._dataSource);
  final MoviesListDataSource _dataSource;

  @override
  Future<MoviesListEntity?> call(int list, int page) => _dataSource(list, page);
}
