import 'package:career_coach/domain/entity/auth_entity.dart';
import 'package:career_coach/domain/repository/auth_repository.dart';

class LoginUseCase {
  final AuthRepository _authRepository;

  LoginUseCase(this._authRepository);

  Future<AuthEntity> call({
    required String login,
    required String password,
  }) async {
    return await _authRepository.login(
      login: login,
      password: password,
    );
  }
}