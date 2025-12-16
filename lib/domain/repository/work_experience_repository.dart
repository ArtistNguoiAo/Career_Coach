import 'package:career_coach/domain/entity/work_experience_entity.dart';

abstract class WorkExperienceRepository {
  Future<List<WorkExperienceEntity>> getWorkExperiences({
    required int userResumeId,
  });

  Future<List<WorkExperienceEntity>> saveWorkExperiences({
    required int userResumeId,
    required List<WorkExperienceEntity> listWorkExperience,
  });
}