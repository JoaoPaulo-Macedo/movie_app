import '../models/movies_list.dart';
import '../repositories/movies_repository.dart';

class MoviesRepositoryDecorator implements MoviesRepository {
  MoviesRepositoryDecorator(this.repository);

  final MoviesRepository repository;

  @override
  Future<MoviesList?> getMovies() async {
    return await repository.getMovies();
  }
}
