import 'package:movie_app/domain/entities/movies_list.dart';

abstract class MoviesDataSource {
  Future<MoviesListEntity?> call();
}
