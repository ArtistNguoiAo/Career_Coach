import 'package:career_coach/data/mapper/user_resume_mapper.dart';
import 'package:career_coach/data/mapper/user_resume_recent_mapper.dart';
import 'package:career_coach/data/remote/user_resume_remote.dart';
import 'package:career_coach/data/request_body/user_resume_layout_request_body.dart';
import 'package:career_coach/data/request_body/user_resume_request_body.dart';
import 'package:career_coach/domain/entity/user_resume_entity.dart';
import 'package:career_coach/domain/entity/user_resume_recent_entity.dart';
import 'package:career_coach/domain/repository/user_resume_repository.dart';

class UserResumeRepositoryImpl implements UserResumeRepository {
  final UserResumeRemote _userResumeRemote;

  UserResumeRepositoryImpl(this._userResumeRemote);

  @override
  Future<List<UserResumeRecentEntity>> getListUserResumeRecent({
    required int limit,
  }) async {
    final response = await _userResumeRemote.getListUserResumeRecent(
      limit: limit,
    );
    return response.data.map(UserResumeRecentMapper.toEntity).toList();
  }

  @override
  Future<UserResumeEntity> createNewUserResume({required int resumeId}) async {
    final response = await _userResumeRemote.createNewUserResume(
      resumeId: resumeId,
    );
    return UserResumeMapper.toEntity(response.data);
  }

  @override
  Future<UserResumeEntity> createNewUserResumeCopy({
    required int resumeId,
    required int userResumeId,
  }) async {
    final response = await _userResumeRemote.createNewUserResumeCopy(
      resumeId: resumeId,
      userResumeId: userResumeId,
    );
    return UserResumeMapper.toEntity(response.data);
  }

  @override
  Future<List<UserResumeEntity>> getListUserResume({
    required int page,
    required int size,
    required String status,
  }) async {
    final response = await _userResumeRemote.getListUserResume(
      page: page,
      size: size,
      status: status,
    );
    return response.data.content.map(UserResumeMapper.toEntity).toList();
  }

  @override
  Future<UserResumeEntity> getDetailUserResume({required int id}) async {
    final response = await _userResumeRemote.getDetailUserResume(id: id);
    return UserResumeMapper.toEntity(response.data);
  }

  @override
  Future<UserResumeEntity> saveUserResume({
    required int id,
    required UserResumeEntity userResumeEntity,
  }) async {
    final response = await _userResumeRemote.saveUserResume(
      id: id,
      userResumeRequestBody: UserResumeRequestBody(
        id: userResumeEntity.id,
        title: userResumeEntity.title,
        numberOfColumns: userResumeEntity.numberOfColumns,
        language: userResumeEntity.language.name,
        fontFamily: userResumeEntity.fontFamily.name,
        fontSize: userResumeEntity.fontSize,
        lineHeight: userResumeEntity.lineHeight,
        color: userResumeEntity.color,
        layouts: userResumeEntity.layouts
            .map(UserResumeLayoutRequestBody.fromEntity)
            .toList(),
      ),
    );
    return UserResumeMapper.toEntity(response.data);
  }
}
