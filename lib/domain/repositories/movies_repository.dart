import 'package:movie_app/domain/entities/movies_list.dart';

abstract class MoviesRepository {
  Future<MoviesListEntity?> call();
}
