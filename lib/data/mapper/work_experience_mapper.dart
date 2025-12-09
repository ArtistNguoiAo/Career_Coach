import 'package:career_coach/data/model/work_experience_model.dart';
import 'package:career_coach/domain/entity/work_experience_entity.dart';

class WorkExperienceMapper {
  static WorkExperienceEntity toEntity(WorkExperienceModel workExperienceModel) {
    return WorkExperienceEntity(
      id: workExperienceModel.id,
      userResumeId: workExperienceModel.userResumeId,
      displayOrder: workExperienceModel.displayOrder,
      company: workExperienceModel.company,
      position: workExperienceModel.position,
      startTime: workExperienceModel.startTime,
      endTime: workExperienceModel.endTime,
      description: workExperienceModel.description,
    );
  }
}