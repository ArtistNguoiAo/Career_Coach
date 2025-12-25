import 'dart:io';

import 'package:career_coach/data/data_source/api_response.dart';
import 'package:career_coach/data/data_source/api_service.dart';
import 'package:career_coach/data/model/interview_model.dart';
import 'package:career_coach/data/model/message_model.dart';
import 'package:career_coach/data/request_body/interview_request_body.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'interview_remote.g.dart';

@RestApi(baseUrl: '/api/v1/interviews')
abstract class InterviewRemote {
  factory InterviewRemote(ApiService apiService) = _InterviewRemote;

  @GET('/active')
  Future<ApiResponse<PagedData<InterviewModel>>> getListInterviewActive({
    @Query('page') required int page,
    @Query('size') required int size,
  });

  @GET('/history')
  Future<ApiResponse<PagedData<InterviewModel>>> getListInterviewHistory({
    @Query('page') required int page,
    @Query('size') required int size,
  });

  @GET('/{sessionId}/messages')
  Future<ApiResponse<PagedData<MessageModel>>> getListMessageInterview({
    @Path('sessionId') required int sessionId,
    @Query('page') required int page,
    @Query('size') required int size,
  });

  @POST('/start')
  @MultiPart()
  Future<ApiResponse<InterviewModel>> startInterview({
    @Part(name: 'request') required String request,
    @Part(name: 'file') File? file,
  });
}