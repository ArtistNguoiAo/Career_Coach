import 'package:career_coach/domain/entity/interview_entity.dart';

abstract class InterviewRepository {
  Future<List<InterviewEntity>> getListInterviewActive({
    required int page,
    required int size,
  });

  Future<List<InterviewEntity>> getListInterviewHistory({
    required int page,
    required int size,
  });
}