import 'package:movie_app/domain/entities/favorite_movies_list_entity.dart';

extension FavoriteMoviesListDTO on FavoriteMoviesListEntity {
  static FavoriteMoviesListEntity fromJson(Map<String, dynamic> json) {
    return FavoriteMoviesListEntity(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;

    return json;
  }
}