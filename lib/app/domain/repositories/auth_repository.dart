import 'package:movie_app/app/data/dtos/request_token_dto.dart';
import 'package:movie_app/app/domain/entities/login_params_entity.dart';

abstract class AuthenticationRepository {
  Future<bool> loginUser(LoginParamsEntity loginParams);
  logoutUser();
}