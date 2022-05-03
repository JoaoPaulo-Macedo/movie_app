import 'package:movie_app/app/domain/entities/created_by_entity.dart';
import 'package:movie_app/app/domain/entities/favorite_movies_list_entity.dart';
import 'package:movie_app/app/domain/entities/movie_entity.dart';

class ListEntity {
  ListEntity({
    required this.id,
    required this.averageRating,
    required this.createdBy,
    required this.description,
    required this.posterPath,
    required this.name,
    required this.public,
    required this.revenue,
    required this.runtime,
    required this.sortBy,
    required this.page,
    required this.totalPages,
    required this.totalResults,
    required this.movies,
  });

  final int page;
  final int totalPages;
  final int totalResults;
  final List<MovieEntity> movies;
  final int id;
  final num? averageRating;
  final CreatedByEntity? createdBy;
  final String? description;
  final String? posterPath;
  final String name;
  final bool? public;
  final int? revenue;
  final int? runtime;
  final String? sortBy;

  @override
  String toString() {
    List<String> moviesToString = [];

    for (var e in movies) {
      moviesToString.add(e.title);
    }

    return "name: $name, totalResults: $totalResults, movies: $moviesToString";
  }
}
