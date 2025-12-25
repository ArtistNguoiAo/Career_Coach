import 'dart:convert';
import 'dart:io';

import 'package:career_coach/data/mapper/create_interview_mapper.dart';
import 'package:career_coach/data/mapper/interview_mapper.dart';
import 'package:career_coach/data/mapper/message_mapper.dart';
import 'package:career_coach/data/remote/interview_remote.dart';
import 'package:career_coach/data/request_body/interview_request_body.dart';
import 'package:career_coach/domain/entity/create_interview_entity.dart';
import 'package:career_coach/domain/entity/interview_entity.dart';
import 'package:career_coach/domain/entity/message_entity.dart';
import 'package:career_coach/domain/enum/type_cv_source_enum.dart';
import 'package:career_coach/domain/enum/type_experience_level_enum.dart';
import 'package:career_coach/domain/enum/type_language_enum.dart';
import 'package:career_coach/domain/repository/interview_repository.dart';
import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';

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
  }) async {
    final response = await _interviewRemote.getListMessageInterview(sessionId: sessionId);
    return response.data.map(MessageMapper.toEntity).toList();
  }

  @override
  Future<CreateInterviewEntity> startInterview({
    required TypeCvSourceEnum cvSource,
    int? userResumeId,
    required TypeCvExperienceLevelEnum experienceLevel,
    required TypeLanguageEnum language,
    File? file,
  }) async {
    final requestBody = InterviewRequestBody(
      cvSource: cvSource.name,
      userResumeId: userResumeId,
      experienceLevel: experienceLevel.name,
      language: language.name,
    );

    final Map<String, MultipartFile> parts = {};
    final jsonBytes = utf8.encode(jsonEncode(requestBody.toJson()));
    parts['request'] = MultipartFile.fromBytes(
      jsonBytes,
      filename: "request.json",
      contentType: MediaType("application","json"),
    );

    if (file != null) {
      final bytes = await file.readAsBytes();
      final fileName = file.path.split('/').last;
      final mimeType = 'application/pdf';
      final mediaParts = mimeType.split('/');

      parts['file'] = MultipartFile.fromBytes(
        bytes,
        filename: fileName,
        contentType: MediaType(mediaParts[0], mediaParts[1]),
      );
    }

    final response = await _interviewRemote.startInterview(parts: parts);
    return CreateInterviewMapper.toEntity(response.data);
  }

  @override
  Future<InterviewEntity> endInterview({required int sessionId}) async {
    final response = await _interviewRemote.endInterview(sessionId: sessionId);
    return InterviewMapper.toEntity(response.data);
  }
}
