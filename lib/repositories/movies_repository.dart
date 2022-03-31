import '../models/movies_list.dart';

abstract class MoviesRepository {
  Future<MoviesList?> getMovies();
}
