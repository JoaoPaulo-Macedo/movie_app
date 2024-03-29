import 'package:movie_app/app/domain/entities/movie_entity.dart';
import 'package:movie_app/app/domain/entities/movies_list_entity.dart';

extension ListDTO on ListEntity {
  ListEntity copyWith({List<MovieEntity>? movies}) {
    return ListEntity(
      averageRating: averageRating,
      createdBy: createdBy,
      description: description,
      posterPath: posterPath,
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
