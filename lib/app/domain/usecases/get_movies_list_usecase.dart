import 'package:movie_app/app/domain/entities/movies_list_entity.dart';

abstract class GetMoviesListUseCase {
  Future<MoviesListEntity?> call({int list, int page});
}
