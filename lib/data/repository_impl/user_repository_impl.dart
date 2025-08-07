import 'dart:io';

import 'package:career_coach/data/mapper/user_mapper.dart';
import 'package:career_coach/data/remote/user_remote.dart';
import 'package:career_coach/data/request_body/update_profile_request_body.dart';
import 'package:career_coach/domain/entity/user_entity.dart';
import 'package:career_coach/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemote _userRemote;
  UserRepositoryImpl(this._userRemote);

  @override
  Future<UserEntity> getProfile() async {
    final response = await _userRemote.getProfile();
    return UserMapper.toEntity(response.data);
  }

  @override
  Future<UserEntity> updateAvatar(File avatar) async {
    final response = await _userRemote.updateAvatar(
      avatar: avatar,
    );
    return UserMapper.toEntity(response.data);
  }

  @override
  Future<UserEntity> updateProfile({
    required String fullName,
    required String email,
    required String phone,
  }) async {
    final response = await _userRemote.updateProfile(
      updateProfileRequestBody: UpdateProfileRequestBody(
        fullName: fullName,
        email: email,
        phone: phone,
      ),
    );
    return UserMapper.toEntity(response.data);
  }

  @override
  Future<void> deleteAccount() async {
    final response = await _userRemote.deleteAccount();
    return response.data;
  }
}