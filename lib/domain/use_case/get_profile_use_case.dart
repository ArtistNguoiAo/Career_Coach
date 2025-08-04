import 'package:career_coach/domain/entity/user_entity.dart';
import 'package:career_coach/domain/repository/user_repository.dart';

class GetProfileUseCase {
  final UserRepository _userRepository;

  GetProfileUseCase(this._userRepository);

  Future<UserEntity> call() async {
    return await _userRepository.getProfile();
  }
}