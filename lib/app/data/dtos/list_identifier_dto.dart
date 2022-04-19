import 'package:movie_app/app/domain/entities/list_identifier_entity.dart';

extension ListIdentifierDTO on ListIdentifierEntity {
  static ListIdentifierEntity fromJson(Map<String, dynamic> json) {
    return ListIdentifierEntity(
      id: json['id'],
      name: json['name'],
      posterPath: json['poster_path'],
      totalMovies: json['total_results'],
      userName:
          json['created_by'] != null ? json['created_by']['name'] : json['name'],
      averageRating: json['average_rating'],
    );
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    json['poster_path'] = posterPath;
    json['total_results'] = totalMovies;
    json['user_name'] = userName;
    json['average_rating'] = averageRating;

    return json;
  }
}
