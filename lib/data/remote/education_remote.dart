import 'package:career_coach/data/data_source/api_response.dart';
import 'package:career_coach/data/data_source/api_service.dart';
import 'package:career_coach/data/model/education_model.dart';
import 'package:career_coach/data/request_body/education_request_body.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'education_remote.g.dart';

@RestApi(baseUrl: '/api/v1/educations')
abstract class EducationRemote {
  factory EducationRemote(ApiService apiService) = _EducationRemote;

  @GET('/by-user-resume/{userResumeId}')
  Future<ApiResponse<List<EducationModel>>> getEducations({
    @Path('userResumeId') required int userResumeId,
  });

  @POST('/save-all/{userResumeId}')
  Future<ApiResponse<List<EducationModel>>> saveEducations({
    @Path('userResumeId') required int userResumeId,
    @Body() required List<EducationRequestBody> listEducationRequestBody,
  });
}