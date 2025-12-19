import 'dart:io';

import 'package:career_coach/domain/entity/avatar_entity.dart';
import 'package:career_coach/domain/repository/avatar_repository.dart';

class SaveAvatarUseCase {
  final AvatarRepository _avatarRepository;

  SaveAvatarUseCase(this._avatarRepository);

  Future<AvatarEntity> call({required int userResumeId, required File file}) async {
    return await _avatarRepository.saveAvatar(userResumeId: userResumeId, file: file);
  }
}
