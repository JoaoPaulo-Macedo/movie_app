import 'package:movie_app/app/domain/entities/login_params_entity.dart';

abstract class AuthenticationRepository {
  Future<bool> loginUser(LoginParamsEntity loginParams);
  Future<bool> isLogedIn();
  logoutUser();
}
