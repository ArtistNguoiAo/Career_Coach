import 'package:career_coach/domain/entity/user_resume_entity.dart';
import 'package:career_coach/domain/entity/user_resume_recent_entity.dart';

abstract class UserResumeRepository {
  Future<List<UserResumeRecentEntity>> getListUserResumeRecent({
    required int limit,
  });

  Future<UserResumeEntity> createNewUserResume({
    required int resumeId,
  });

  Future<UserResumeEntity> createNewUserResumeCopy({
    required int resumeId,
    required int userResumeId,
  });

  Future<List<UserResumeEntity>> getListUserResume({
    required int page,
    required int size,
    required String status,
  });

  Future<UserResumeEntity> getDetailUserResume({
    required int id,
  });

  Future<UserResumeEntity> saveUserResume({
    required int id,
    required UserResumeEntity userResumeEntity,
  });
}