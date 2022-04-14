import 'package:movie_app/domain/entities/created_by_entity.dart';

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
