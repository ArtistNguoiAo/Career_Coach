import 'package:career_coach/domain/enum/type_cv_source_enum.dart';
import 'package:career_coach/domain/enum/type_experience_level_enum.dart';
import 'package:career_coach/domain/enum/type_interview_status_enum.dart';
import 'package:career_coach/domain/enum/type_language_enum.dart';

class InterviewEntity {
  final int id;
  final String userId;
  final int userResumeId;
  final String uploadedCvPath;
  final TypeCvSourceEnum cvSource;
  final TypeCvExperienceLevelEnum experienceLevel;
  TypeInterviewStatusEnum status;
  final TypeLanguageEnum language;
  final String conversationContext;
  final String startTime;
  final String endTime;
  final int totalMessages;

  InterviewEntity({
    required this.id,
    required this.userId,
    required this.userResumeId,
    required this.uploadedCvPath,
    required this.cvSource,
    required this.experienceLevel,
    required this.status,
    required this.language,
    required this.conversationContext,
    required this.startTime,
    required this.endTime,
    required this.totalMessages,
  });
}
