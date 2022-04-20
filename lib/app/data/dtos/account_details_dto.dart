import 'package:movie_app/app/domain/entities/account_details_entity.dart';

extension AccountDetailsDTO on AccountDetailsEntity {
  static AccountDetailsEntity fromJson(Map<String, dynamic> json) {
    return AccountDetailsEntity(
      avatar: AvatarDTO.fromJson(json['avatar']),
      id: json['id'],
      name: json['name'],
      includeAdult: json['include_adult'],
      username: json['username'],
    );
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['avatar'] = avatar.toJson();
    _data['id'] = id;
    _data['name'] = name;
    _data['include_adult'] = includeAdult;
    _data['username'] = username;
    return _data;
  }
}

extension AvatarDTO on AvatarEntity {
  static AvatarEntity fromJson(Map<String, dynamic> json) {
    return AvatarEntity(gravatar: json['gravatar'], tmdb: json['tmdb']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['gravatar'] = gravatar;
    _data['tmdb'] = tmdb;
    return _data;
  }
}
