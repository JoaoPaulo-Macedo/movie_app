import 'package:movie_app/app/domain/entities/login_params_entity.dart';

extension LoginParamsDTO on LoginParamsEntity {
  static LoginParamsEntity fromJson(Map json) {
    return LoginParamsEntity(
      username: json['username'] ?? '',
      password: json['password'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final json = <String, dynamic>{};
  
    json['username'] = username;
    json['password'] = password;
  
    return json;
  }
}