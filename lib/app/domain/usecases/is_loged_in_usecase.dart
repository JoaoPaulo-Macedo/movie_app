import 'package:movie_app/app/domain/repositories/authentication_repository.dart';

abstract class IsLogedInUseCase {
  Future<bool> call();
}

class IsLogedInUseCaseImp extends IsLogedInUseCase {
  IsLogedInUseCaseImp(this._repository);

  final AuthenticationRepository _repository;

  @override
  Future<bool> call() async {
    return await _repository.isLogedIn();
  }
}
