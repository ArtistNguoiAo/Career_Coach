import 'package:career_coach/domain/entity/interview_entity.dart';
import 'package:career_coach/domain/repository/interview_repository.dart';

class EndInterviewUseCase {
  final InterviewRepository _interviewRepository;

  EndInterviewUseCase(this._interviewRepository);

  Future<InterviewEntity> call({
    required int sessionId,
  }) async {
    return await _interviewRepository.endInterview(
      sessionId: sessionId,
    );
  }
}
