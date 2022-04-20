import 'package:movie_app/app/domain/entities/login_params_entity.dart';
import 'package:movie_app/app/domain/repositories/auth_repository.dart';

abstract class LoginUserUseCase {
  call(String username, String pass);
}

class LoginUserUseCaseImp extends LoginUserUseCase {
  LoginUserUseCaseImp(this._repository);

  final AuthenticationRepository _repository;

  @override
  call(String username, String pass) {
    _repository.loginUser(
      LoginParamsEntity(username: 'macedo.722', password: 'ninaekiara'),
    );
    // _repository.loginUser(
    //   LoginParamsEntity(userName: username, password: pass),
    // );
  }
}
