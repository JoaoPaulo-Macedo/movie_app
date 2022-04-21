import 'package:movie_app/app/domain/entities/movie_entity.dart';

class FavoriteMoviesListEntity {
  FavoriteMoviesListEntity({
    required this.page,
    required this.movies,
    required this.totalPages,
    required this.totalResults,
  });
  
  final int page;
  final List<MovieEntity> movies;
  final int totalPages;
  final int totalResults;

}
