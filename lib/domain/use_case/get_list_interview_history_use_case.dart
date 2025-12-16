import 'package:career_coach/domain/entity/interview_entity.dart';
import 'package:career_coach/domain/repository/interview_repository.dart';

class GetListInterviewHistoryUseCase {
  final InterviewRepository _interviewRepository;

  GetListInterviewHistoryUseCase(this._interviewRepository);

  Future<List<InterviewEntity>> call({required int page, required int size}) async {
    return await _interviewRepository.getListInterviewHistory(page: page, size: size);
  }
}
