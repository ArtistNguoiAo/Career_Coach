import 'dart:io';
import 'package:career_coach/domain/entity/avatar_entity.dart';

abstract class AvatarRepository {
  Future<AvatarEntity> getAvatar({
    required int userResumeId,
  });

  Future<AvatarEntity> saveAvatar({
    required int userResumeId,
    required File file,
  });
}