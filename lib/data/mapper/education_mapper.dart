import 'package:career_coach/data/model/education_model.dart';
import 'package:career_coach/domain/entity/education_entity.dart';

class EducationMapper {
  static EducationEntity toEntity(EducationModel educationModel) {
    return EducationEntity(
      id: educationModel.id,
      userResumeId: educationModel.userResumeId,
      displayOrder: educationModel.displayOrder,
      school: educationModel.school,
      degree: educationModel.degree,
      major: educationModel.major,
      startTime: educationModel.startTime,
      endTime: educationModel.endTime,
      description: educationModel.description,
    );
  }
}