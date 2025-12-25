import 'package:career_coach/data/model/interview_model.dart';
import 'package:career_coach/domain/entity/interview_entity.dart';
import 'package:career_coach/domain/enum/type_cv_source_enum.dart';
import 'package:career_coach/domain/enum/type_experience_level_enum.dart';
import 'package:career_coach/domain/enum/type_interview_status_enum.dart';
import 'package:career_coach/domain/enum/type_language_enum.dart';

class InterviewMapper {
  static InterviewEntity toEntity(InterviewModel interviewModel) {
    return InterviewEntity(
      id: interviewModel.id,
      userId: interviewModel.userId,
      userResumeId: interviewModel.userResumeId,
      uploadedCvPath: interviewModel.uploadedCvPath,
      cvSource: TypeCvSourceEnumExtension.fromString(interviewModel.cvSource),
      experienceLevel: TypeCvExperienceLevelEnumExtension.fromString(interviewModel.experienceLevel),
      status: TypeInterviewStatusEnumExtension.fromString(interviewModel.status),
      language: TypeLanguageEnumExtension.fromString(interviewModel.language),
      conversationContext: interviewModel.conversationContext,
      startTime: interviewModel.startTime,
      endTime: interviewModel.endTime,
      totalMessages: interviewModel.totalMessages,
    );
  }
}