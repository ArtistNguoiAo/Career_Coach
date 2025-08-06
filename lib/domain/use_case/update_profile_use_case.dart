import 'package:career_coach/domain/entity/user_entity.dart';
import 'package:career_coach/domain/repository/user_repository.dart';

class UpdateProfileUseCase {
  final UserRepository _userRepository;

  UpdateProfileUseCase(this._userRepository);

  Future<UserEntity> call({
    required String fullName,
    required String email,
    required String phone,
  }) async {
    return await _userRepository.updateProfile(
      fullName: fullName,
      email: email,
      phone: phone,
    );
  }
}