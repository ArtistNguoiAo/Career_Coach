import 'package:career_coach/domain/entity/education_entity.dart';

abstract class EducationRepository {
  Future<List<EducationEntity>> getEducations({
    required int userResumeId,
  });

  Future<List<EducationEntity>> saveEducations({
    required int userResumeId,
    required List<EducationEntity> listEducation,
  });
}