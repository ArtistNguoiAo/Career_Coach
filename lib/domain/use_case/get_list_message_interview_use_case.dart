import 'package:career_coach/domain/entity/message_entity.dart';
import 'package:career_coach/domain/repository/interview_repository.dart';

class GetListMessageInterviewUseCase {
  final InterviewRepository _interviewRepository;

  GetListMessageInterviewUseCase(this._interviewRepository);

  Future<List<MessageEntity>> call({required int sessionId}) async {
    return await _interviewRepository.getListMessageInterview(sessionId: sessionId);
  }
}
