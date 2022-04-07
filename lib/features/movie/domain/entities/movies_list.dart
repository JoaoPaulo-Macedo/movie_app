import 'package:movie_app/features/movie/domain/entities/created_by.dart';
import 'package:movie_app/features/movie/domain/entities/movie.dart';

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
  
  late final num averageRating;
  late final CreatedByEntity createdBy;
  late final String description;
  late final int id;
  late final String name;
  late final int page;
  late final bool public;
  late final List<MovieEntity> movies;
  late final int revenue;
  late final int runtime;
  late final String sortBy;
  late final int totalPages;
  late final int totalResults;

  @override
  String toString() {
    return "averageRating: $averageRating;\ncreatedBy: $createdBy;\ndescription: $description;\nid: $id;\nname: $name;\npage: $page;\npublic: $public;\nmovies: $movies;\nrevenue: $revenue;\nruntime: $runtime;\nsortBy: $sortBy;\ntotalPages: $totalPages;\ntotalResults: $totalResults;\n";
  }
}
