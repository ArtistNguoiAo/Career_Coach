import 'package:career_coach/domain/entity/user_resume_recent_entity.dart';

abstract class UserResumeRepository {
  Future<List<UserResumeRecentEntity>> getListUserResumeRecent({
    required int limit,
  });
}