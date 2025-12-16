import 'package:career_coach/domain/entity/interview_entity.dart';
import 'package:career_coach/domain/repository/interview_repository.dart';

class GetListInterviewActiveUseCase {
  final InterviewRepository _interviewRepository;

  GetListInterviewActiveUseCase(this._interviewRepository);

  Future<List<InterviewEntity>> call({required int page, required int size}) async {
    return await _interviewRepository.getListInterviewActive(page: page, size: size);
  }
}
