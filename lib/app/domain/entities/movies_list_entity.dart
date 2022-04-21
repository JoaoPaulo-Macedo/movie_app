import 'package:movie_app/app/domain/entities/created_by_entity.dart';
import 'package:movie_app/app/domain/entities/movie_entity.dart';

class MoviesListEntity {
  MoviesListEntity({
    required this.id,
    required this.averageRating,
    required this.createdBy,
    required this.description,
    required this.posterPath,
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

  final int id;
  final num? averageRating;
  final CreatedByEntity? createdBy;
  final String? description;
  final String? posterPath;
  final String name;
  final int page;
  final bool? public;
  final List<MovieEntity> movies;
  final int? revenue;
  final int? runtime;
  final String? sortBy;
  final int totalPages;
  final int totalResults;

  @override
  String toString() {
    List<String> moviesToString = [];

    for (var e in movies) {
      moviesToString.add(e.title);
    }

    return "name: $name, totalResults: $totalResults, movies: $moviesToString";
  }
}
