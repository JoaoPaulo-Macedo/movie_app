import 'package:movie_app/domain/entities/movies_list_entity.dart';

abstract class GetMoviesListUseCase {
  Future<MoviesListEntity?> call({int list, int page});
}
