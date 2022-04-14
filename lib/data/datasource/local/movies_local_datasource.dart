import 'package:movie_app/data/datasource/movies_datasource.dart';
import 'package:movie_app/domain/entities/movies_list.dart';

class MoviesLocalDataSourceDecorator implements MoviesDataSource {
  MoviesLocalDataSourceDecorator(this._dataSource);
  final MoviesDataSource _dataSource;

  @override
  Future<MoviesListEntity?> call() => _dataSource();
}
