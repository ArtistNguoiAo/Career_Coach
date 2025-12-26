import 'package:career_coach/domain/entity/analysis_entity.dart';
import 'package:career_coach/domain/repository/interview_repository.dart';

class GetAnalysisInterviewUseCase {
  final InterviewRepository _interviewRepository;

  GetAnalysisInterviewUseCase(this._interviewRepository);

  Future<AnalysisEntity> call({required int sessionId}) async {
    return await _interviewRepository.getAnalysisInterview(
      sessionId: sessionId,
    );
  }
}