import 'package:career_coach/data/model/create_interview_model.dart';
import 'package:career_coach/domain/entity/create_interview_entity.dart';
import 'package:career_coach/domain/enum/type_experience_level_enum.dart';
import 'package:career_coach/domain/enum/type_interview_status_enum.dart';

class CreateInterviewMapper {
  static CreateInterviewEntity toEntity(CreateInterviewModel createInterviewModel) {
    return CreateInterviewEntity(
      sessionId: createInterviewModel.sessionId,
      experienceLevel: TypeCvExperienceLevelEnumExtension.fromString(createInterviewModel.experienceLevel),
      status: TypeInterviewStatusEnumExtension.fromString(createInterviewModel.status),
      initialMessage: createInterviewModel.initialMessage,
      startedAt: createInterviewModel.startedAt,
    );
  }
}