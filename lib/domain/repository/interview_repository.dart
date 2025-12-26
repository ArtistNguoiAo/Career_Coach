import 'package:career_coach/domain/entity/analysis_entity.dart';
import 'package:career_coach/domain/entity/create_interview_entity.dart';
import 'package:career_coach/domain/entity/interview_entity.dart';
import 'package:career_coach/domain/entity/message_entity.dart';
import 'package:career_coach/domain/enum/type_cv_source_enum.dart';
import 'package:career_coach/domain/enum/type_experience_level_enum.dart';
import 'package:career_coach/domain/enum/type_language_enum.dart';

abstract class InterviewRepository {
  Future<List<InterviewEntity>> getListInterviewActive({
    required int page,
    required int size,
  });

  Future<List<InterviewEntity>> getListInterviewHistory({
    required int page,
    required int size,
  });

  Future<List<MessageEntity>> getListMessageInterview({
    required int sessionId,
  });

  Future<CreateInterviewEntity> startInterview({
    required TypeCvSourceEnum cvSource,
    int? userResumeId,
    required TypeCvExperienceLevelEnum experienceLevel,
    required TypeLanguageEnum language,
  });

  Future<InterviewEntity> endInterview({
    required int sessionId,
  });

  Future<AnalysisEntity> getAnalysisInterview({
    required int sessionId,
  });
}