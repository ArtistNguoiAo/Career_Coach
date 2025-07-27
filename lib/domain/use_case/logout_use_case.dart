import 'package:career_coach/domain/repository/auth_repository.dart';

class LogoutUseCase {
  final AuthRepository _authRepository;

  LogoutUseCase(this._authRepository);

  Future<void> call({
    required String refreshToken,
  }) async {
    return await _authRepository.logout(
      refreshToken: refreshToken,
    );
  }
}