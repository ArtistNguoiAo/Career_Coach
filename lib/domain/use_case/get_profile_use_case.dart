import 'package:career_coach/domain/entity/user_entity.dart';
import 'package:career_coach/domain/repository/auth_repository.dart';

class GetProfileUseCase {
  final AuthRepository _authRepository;

  GetProfileUseCase(this._authRepository);

  Future<UserEntity> call() async {
    return await _authRepository.getProfile();
  }
}