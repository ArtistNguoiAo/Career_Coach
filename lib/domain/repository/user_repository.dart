import 'dart:io';

import 'package:career_coach/domain/entity/user_entity.dart';

abstract class UserRepository {
  Future<UserEntity> getProfile();
  Future<UserEntity> updateAvatar(File avatarUrl);
}