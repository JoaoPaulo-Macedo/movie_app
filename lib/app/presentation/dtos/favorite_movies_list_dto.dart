import 'package:movie_app/app/domain/entities/favorite_movies_list_entity.dart';
import 'package:movie_app/app/domain/entities/movie_entity.dart';

extension FavoriteMoviesListDTO on FavoriteMoviesListEntity {
  FavoriteMoviesListEntity copyWith({List<MovieEntity>? movies}) {
    return FavoriteMoviesListEntity(
      page: page,
      movies: movies ?? this.movies,
      totalPages: totalPages,
      totalResults: totalResults,
    );
  }
}
