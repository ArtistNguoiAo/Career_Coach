import 'dart:io';
import 'package:career_coach/data/mapper/avatar_mapper.dart';
import 'package:career_coach/data/remote/avatar_remote.dart';
import 'package:career_coach/domain/entity/avatar_entity.dart';
import 'package:career_coach/domain/repository/avatar_repository.dart';

class AvatarRepositoryImpl implements AvatarRepository {
  final AvatarRemote _avatarRemote;

  AvatarRepositoryImpl(this._avatarRemote);

  @override
  Future<AvatarEntity> getAvatar({required int userResumeId}) async {
    final response = await _avatarRemote.getAvatar(userResumeId: userResumeId);
    return AvatarMapper.toEntity(response.data);
  }

  @override
  Future<AvatarEntity> saveAvatar({
    required int userResumeId,
    required File file,
  }) async {
    final response = await _avatarRemote.saveAvatar(
      userResumeId: userResumeId,
      file: file,
    );
    return AvatarMapper.toEntity(response.data);
  }
}
