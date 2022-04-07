import 'package:movie_app/features/movie/domain/entities/movie.dart';
import 'package:movie_app/features/movie/domain/entities/movies_list.dart';

extension MoviesListDTO on MoviesListEntity {
  MoviesListEntity copyWith({
    List<MovieEntity>? movies,
  }) {
    return MoviesListEntity(
      averageRating: averageRating,
      createdBy: createdBy,
      description: description,
      id: id,
      name: name,
      page: page,
      public: public,
      movies: movies ?? this.movies,
      revenue: revenue,
      runtime: runtime,
      sortBy: sortBy,
      totalPages: totalPages,
      totalResults: totalResults,
    );
  }
}