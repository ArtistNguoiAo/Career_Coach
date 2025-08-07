import 'dart:io';

import 'package:career_coach/domain/entity/user_entity.dart';
import 'package:career_coach/domain/repository/user_repository.dart';

class UpdateAvatarUseCase {
  final UserRepository _userRepository;

  UpdateAvatarUseCase(this._userRepository);

  Future<UserEntity> call(File avatar) async {
    return await _userRepository.updateAvatar(avatar);
  }
}