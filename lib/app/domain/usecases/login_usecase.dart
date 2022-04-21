import 'package:movie_app/app/domain/entities/login_params_entity.dart';
import 'package:movie_app/app/domain/repositories/auth_repository.dart';

abstract class LoginUseCase {
  Future<bool> call(String username, String password);
  Future<bool> isLogedIn();
  Future<void> logOut();
}

class LoginUserUseCaseImp extends LoginUseCase {
  LoginUserUseCaseImp(this._repository);

  final AuthenticationRepository _repository;

  @override
  Future<bool> call(String username, String password) async {
    return await _repository.loginUser(
      LoginParamsEntity(username: username, password: password),
    );
  }

  @override
  Future<bool> isLogedIn() async {
    return await _repository.isLogedIn();
  }

  //TODO: does future<void> make sence?
  @override
  Future<void> logOut() async {
    await _repository.logoutUser();
  }
}
