class LoginParamsEntity {
  LoginParamsEntity({
    required this.username,
    required this.password,
  });

  final String username;
  final String password;

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};
  
    result.addAll({'username': username});
    result.addAll({'password': password});
  
    return result;
  }
}
