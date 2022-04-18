import 'package:movie_app/domain/entities/list_identifier_entity.dart';

extension ListIdentifierDTO on ListIdentifierEntity {
  static ListIdentifierEntity fromJson(Map<String, dynamic> json) {
    return ListIdentifierEntity(
      id: json['id'],
      name: json['name'],
      posterPath: json['poster_path'],
    );
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
    json['id'] = id;
    json['name'] = name;
    json['poster_path'] = posterPath;

    return json;
  }
}