import 'package:career_coach/domain/enum/type_experience_level_enum.dart';
import 'package:career_coach/domain/enum/type_interview_status_enum.dart';

class CreateInterviewEntity {
  final int sessionId;
  final TypeCvExperienceLevelEnum experienceLevel;
  final TypeInterviewStatusEnum status;
  final String initialMessage;
  final String startedAt;

  CreateInterviewEntity({
    required this.sessionId,
    required this.experienceLevel,
    required this.status,
    required this.initialMessage,
    required this.startedAt,
  });
}
