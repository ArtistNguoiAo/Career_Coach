import 'package:career_coach/domain/entity/create_interview_entity.dart';
import 'package:career_coach/domain/enum/type_cv_source_enum.dart';
import 'package:career_coach/domain/enum/type_experience_level_enum.dart';
import 'package:career_coach/domain/enum/type_language_enum.dart';
import 'package:career_coach/domain/repository/interview_repository.dart';

class CreateInterviewUseCase {
  final InterviewRepository _interviewRepository;

  CreateInterviewUseCase(this._interviewRepository);

  Future<CreateInterviewEntity> call({
    required TypeCvSourceEnum cvSource,
    int? userResumeId,
    required TypeCvExperienceLevelEnum experienceLevel,
    required TypeLanguageEnum language,
  }) async {
    return await _interviewRepository.startInterview(
      cvSource: cvSource,
      userResumeId: userResumeId,
      experienceLevel: experienceLevel,
      language: language,
    );
  }
}
