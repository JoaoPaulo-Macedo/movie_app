import 'package:movie_app/app/domain/entities/favorite_movies_list_entity.dart';
import 'package:movie_app/app/domain/entities/movie_entity.dart';
import 'package:movie_app/app/data/dtos/movie_dto.dart';

extension FavoriteMoviesListDTO on FavoriteMoviesListEntity {
  static FavoriteMoviesListEntity fromJson(Map<String, dynamic> json) {
    return FavoriteMoviesListEntity(
      page: json['page'],
      movies:
          List<MovieEntity>.from(json['results'].map((e) => MovieDTO.fromJson(e))),
      totalPages: json['total_pages'],
      totalResults: json['total_results'],
    );
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};

    json.addAll({'page': page});
    json.addAll({'results': movies.map((e) => e.toJson()).toList()});
    json.addAll({'total_pages': totalPages});
    json.addAll({'total_results': totalResults});

    return json;
  }
}
