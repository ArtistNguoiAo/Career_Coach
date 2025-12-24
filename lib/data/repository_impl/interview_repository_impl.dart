import 'package:career_coach/data/mapper/interview_mapper.dart';
import 'package:career_coach/data/mapper/message_mapper.dart';
import 'package:career_coach/data/remote/interview_remote.dart';
import 'package:career_coach/data/request_body/interview_request_body.dart';
import 'package:career_coach/domain/entity/interview_entity.dart';
import 'package:career_coach/domain/entity/message_entity.dart';
import 'package:career_coach/domain/enum/type_cv_source_enum.dart';
import 'package:career_coach/domain/enum/type_experience_level_enum.dart';
import 'package:career_coach/domain/enum/type_language_enum.dart';
import 'package:career_coach/domain/repository/interview_repository.dart';

class InterviewRepositoryImpl implements InterviewRepository {
  final InterviewRemote _interviewRemote;

  InterviewRepositoryImpl(this._interviewRemote);

  @override
  Future<List<InterviewEntity>> getListInterviewActive({required int page, required int size}) async {
    final response = await _interviewRemote.getListInterviewActive(page: page, size: size);
    return response.data.content.map(InterviewMapper.toEntity).toList();
  }

  @override
  Future<List<InterviewEntity>> getListInterviewHistory({required int page, required int size}) async {
    final response = await _interviewRemote.getListInterviewHistory(page: page, size: size);
    return response.data.content.map(InterviewMapper.toEntity).toList();
  }

  @override
  Future<List<MessageEntity>> getListMessageInterview({
    required int sessionId,
    required int page,
    required int size,
  }) async {
    final response = await _interviewRemote.getListMessageInterview(sessionId: sessionId, page: page, size: size);
    return response.data.content.map(MessageMapper.toEntity).toList();
  }

  @override
  Future<InterviewEntity> startInterview({
    required TypeCvSourceEnum cvSource,
    int? userResumeId,
    required TypeCvExperienceLevelEnum experienceLevel,
    required TypeLanguageEnum language,
  }) async {
    final response = await _interviewRemote.startInterview(
      interviewRequestBody: InterviewRequestBody(
        cvSource: cvSource.name,
        userResumeId: userResumeId,
        experienceLevel: experienceLevel.name,
        language: language.name,
      ),
    );
    return InterviewMapper.toEntity(response.data);
  }
}
