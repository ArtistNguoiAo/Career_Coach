import 'package:career_coach/data/data_source/api_response.dart';
import 'package:career_coach/data/data_source/api_service.dart';
import 'package:career_coach/data/model/work_experience_model.dart';
import 'package:career_coach/data/request_body/work_experience_request_body.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'work_experience_remote.g.dart';

@RestApi(baseUrl: '/api/v1/work-experiences')
abstract class WorkExperienceRemote {
  factory WorkExperienceRemote(ApiService apiService) = _WorkExperienceRemote;

  @GET('/by-user-resume/{userResumeId}')
  Future<ApiResponse<List<WorkExperienceModel>>> getActivities({
    @Path('userResumeId') required int userResumeId,
  });

  @POST('/save-all/{userResumeId}')
  Future<ApiResponse<List<WorkExperienceModel>>> saveActivities({
    @Path('userResumeId') required int userResumeId,
    @Body() required List<WorkExperienceRequestBody> listWorkExperienceRequestBody,
  });
}