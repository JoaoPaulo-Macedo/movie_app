import 'package:movie_app/app/data/dtos/created_by_dto.dart';
import 'package:movie_app/app/data/dtos/movie_dto.dart';
import 'package:movie_app/app/domain/entities/movies_list_entity.dart';

extension ListDTO on ListEntity {
  static ListEntity fromJson(Map json) {
    return ListEntity(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      page: json['page'],
      totalPages: json['total_pages'] ?? 0,
      totalResults: json['total_results'],
      movies: json['results'] != null
          ? List.from(json['results']).map((e) => MovieDTO.fromJson(e)).toList()
          : null,
      averageRating: json['average_rating'],
      createdBy: json['created_by'] != null ? CreatedByDTO.fromJson(json['created_by']) : null,
      description: json['description'],
      posterPath: json['poster_path'],
      public: json['public'],
      revenue: json['revenue'],
      runtime: json['runtime'],
      sortBy: json['sort_by'],
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['average_rating'] = averageRating;
    _data['created_by'] = createdBy?.toJson();
    _data['description'] = description;
    _data['poster_path'] = posterPath;
    _data['id'] = id;
    _data['name'] = name;
    _data['page'] = page;
    _data['public'] = public;
    _data['results'] = movies?.map((e) => e.toJson()).toList();
    _data['revenue'] = revenue;
    _data['runtime'] = runtime;
    _data['sort_by'] = sortBy;
    _data['total_pages'] = totalPages;
    _data['total_results'] = totalResults;
    return _data;
  }
}
