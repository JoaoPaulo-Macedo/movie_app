import 'package:movie_app/app/domain/entities/created_by_entity.dart';
import 'package:movie_app/app/domain/entities/movie_entity.dart';

class MoviesListEntity {
  MoviesListEntity({
    required this.averageRating,
    required this.createdBy,
    required this.description,
    required this.id,
    required this.name,
    required this.page,
    required this.public,
    required this.movies,
    required this.revenue,
    required this.runtime,
    required this.sortBy,
    required this.totalPages,
    required this.totalResults,
  });

  /* late  */final num? averageRating;
  /* late  */final CreatedByEntity? createdBy;
  /* late  */final String? description;
  /* late  */final int id;
  /* late  */final String name;
  /* late  */final int page;
  /* late  */final bool? public;
  /* late  */final List<MovieEntity> movies;
  /* late  */final int? revenue;
  /* late  */final int? runtime;
  /* late  */final String? sortBy;
  /* late  */final int totalPages;
  /* late  */final int totalResults;

  @override
  String toString() {
    List<String> moviesToString = [];
    
    for(var e in movies) {
      moviesToString.add(e.title);
    }

    return "name: $name, totalResults: $totalResults, movies: $moviesToString";
  }
}
