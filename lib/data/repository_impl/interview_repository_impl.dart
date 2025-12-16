import 'package:career_coach/data/mapper/interview_mapper.dart';
import 'package:career_coach/data/remote/interview_remote.dart';
import 'package:career_coach/domain/entity/interview_entity.dart';
import 'package:career_coach/domain/repository/interview_repository.dart';

class InterviewRepositoryImpl implements InterviewRepository {
  final InterviewRemote _interviewRemote;
  InterviewRepositoryImpl(this._interviewRemote);

  @override
  Future<List<InterviewEntity>> getListInterviewActive({required int page, required int size}) async {
    final response =  await _interviewRemote.getListInterviewActive(
      page: page,
      size: size,
    );
    return response.data.content.map(InterviewMapper.toEntity).toList();
  }

  @override
  Future<List<InterviewEntity>> getListInterviewHistory({required int page, required int size}) async {
    final response =  await _interviewRemote.getListInterviewHistory(
      page: page,
      size: size,
    );
    return response.data.content.map(InterviewMapper.toEntity).toList();
  }

}
