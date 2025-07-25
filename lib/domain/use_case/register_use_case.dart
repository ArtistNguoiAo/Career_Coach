import 'package:career_coach/domain/repository/auth_repository.dart';

class RegisterUseCase {
  final AuthRepository _authRepository;

  RegisterUseCase(this._authRepository);

  Future<void> call({
    required String fullName,
    required String email,
    required String phone,
    required String password,
    required String avatar,
  }) async {
    return await _authRepository.register(
      fullName: fullName,
      email: email,
      phone: phone,
      password: password,
      avatar: avatar,
    );
  }
}