import 'package:career_coach/data/model/user_resume_recent_model.dart';
import 'package:career_coach/domain/entity/user_resume_recent_entity.dart';

class UserResumeRecentMapper {
  static UserResumeRecentEntity toEntity(
      UserResumeRecentModel userResumeRecentModel) {
    return UserResumeRecentEntity(
      id: userResumeRecentModel.id,
      title: userResumeRecentModel.title,
      createdAt: userResumeRecentModel.createdAt,
    );
  }
}