import 'created_by.dart';
import 'movie.dart';

class MoviesList {
  MoviesList({
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
  late final CreatedBy createdBy;
  late final String description;
  late final int id;
  late final String name;
  late final int page;
  late final bool public;
  late final List<Movie> movies;
  late final int revenue;
  late final int runtime;
  late final String sortBy;
  late final int totalPages;
  late final int totalResults;

  MoviesList.fromJson(Map<String, dynamic> json) {
    averageRating = json['average_rating'];
    createdBy = CreatedBy.fromJson(json['created_by']);
    description = json['description'];
    id = json['id'];
    name = json['name'];
    page = json['page'];
    public = json['public'];
    movies = List.from(json['results']).map((e) => Movie.fromJson(e)).toList();
    revenue = json['revenue'];
    runtime = json['runtime'];
    sortBy = json['sort_by'];
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['average_rating'] = averageRating;
    _data['created_by'] = createdBy.toJson();
    _data['description'] = description;
    _data['id'] = id;
    _data['name'] = name;
    _data['page'] = page;
    _data['public'] = public;
    _data['results'] = movies.map((e) => e.toJson()).toList();
    _data['revenue'] = revenue;
    _data['runtime'] = runtime;
    _data['sort_by'] = sortBy;
    _data['total_pages'] = totalPages;
    _data['total_results'] = totalResults;
    return _data;
  }

  @override
  String toString() {
    return "averageRating: $averageRating;\ncreatedBy: $createdBy;\ndescription: $description;\nid: $id;\nname: $name;\npage: $page;\npublic: $public;\nmovies: $movies;\nrevenue: $revenue;\nruntime: $runtime;\nsortBy: $sortBy;\ntotalPages: $totalPages;\ntotalResults: $totalResults;\n";
  }
}
