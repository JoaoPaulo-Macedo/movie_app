import 'package:movie_app/app/domain/entities/movies_list_entity.dart';

abstract class MoviesListDataSource {
  Future<ListEntity?> call(int list, int page);
}
