import 'package:movie_app/features/movie/domain/entities/movies_list.dart';

abstract class MoviesDataSource {
  Future<MoviesListEntity?> call();
}
