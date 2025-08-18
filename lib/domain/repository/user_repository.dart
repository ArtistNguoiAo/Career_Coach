import 'dart:io';

import 'package:career_coach/domain/entity/user_entity.dart';

abstract class UserRepository {
  Future<UserEntity> getProfile();
  Future<UserEntity> updateAvatar(File avatarUrl);
  Future<UserEntity> updateProfile({
    required String fullName,
    required String email,
    required String phone,
  });
  Future<void> deleteAccount();
}