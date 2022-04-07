import 'package:movie_app/features/movie/domain/entities/created_by.dart';

extension CreatedByDTO on CreatedByEntity {
  static CreatedByEntity fromJson(Map<String, dynamic> json) {
    return CreatedByEntity(
      id: json['id'],
      name: json['name'],
      username: json['username'],
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['username'] = username;

    return _data;
  }
}
