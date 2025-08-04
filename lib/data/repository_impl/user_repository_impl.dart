import 'dart:io';

import 'package:career_coach/data/data_source/user_data_soure.dart';
import 'package:career_coach/data/mapper/user_mapper.dart';
import 'package:career_coach/data/request_body/update_avatar_request_body.dart';
import 'package:career_coach/domain/entity/user_entity.dart';
import 'package:career_coach/domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserDataSource _userDataSource;
  UserRepositoryImpl(this._userDataSource);

  @override
  Future<UserEntity> getProfile() async {
    final userModel = await _userDataSource.getProfile();
    return UserMapper.toEntity(userModel);
  }

  @override
  Future<UserEntity> updateAvatar(File avatar) async {
    final userModel = await _userDataSource.updateAvatar(
      updateAvatarRequestBody: UpdateAvatarRequestBody(avatar: avatar),
    );
    return UserMapper.toEntity(userModel);
  }
}