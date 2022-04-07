import 'package:movie_app/features/movie/domain/entities/movies_list.dart';

abstract class MoviesRepository {
  Future<MoviesListEntity?> call();
}
