import 'package:movie_app/data/dtos/created_by_dto.dart';
import 'package:movie_app/data/dtos/movie_dto.dart';
import 'package:movie_app/domain/entities/movies_list_entity.dart';

extension MoviesListDTO on MoviesListEntity {
  static MoviesListEntity fromJson(Map json) {
    return MoviesListEntity(
    averageRating: json['average_rating'],
    createdBy: CreatedByDTO.fromJson(json['created_by']),
    description: json['description'],
    id: json['id'],
    name: json['name'],
    page: json['page'],
    public: json['public'],
    movies: List.from(json['results']).map((e) => MovieDTO.fromJson(e)).toList(),
    revenue: json['revenue'],
    runtime: json['runtime'],
    sortBy: json['sort_by'],
    totalPages: json['total_pages'],
    totalResults: json['total_results'],);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['average_rating'] = averageRating;
    _data['created_by'] = createdBy?.toJson();
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
}
