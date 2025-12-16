import 'package:career_coach/data/data_source/api_response.dart';
import 'package:career_coach/data/data_source/api_service.dart';
import 'package:career_coach/data/model/skill_model.dart';
import 'package:career_coach/data/request_body/skill_request_body.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'skill_remote.g.dart';

@RestApi(baseUrl: '/api/v1/skills')
abstract class SkillRemote {
  factory SkillRemote(ApiService apiService) = _SkillRemote;

  @GET('/by-user-resume/{userResumeId}')
  Future<ApiResponse<List<SkillModel>>> getSkills({
    @Path('userResumeId') required int userResumeId,
  });

  @POST('/save-all/{userResumeId}')
  Future<ApiResponse<List<SkillModel>>> saveSkills({
    @Path('userResumeId') required int userResumeId,
    @Body() required List<SkillRequestBody> listSkillRequestBody,
  });
}