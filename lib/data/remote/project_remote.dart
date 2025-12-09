import 'package:career_coach/data/data_source/api_response.dart';
import 'package:career_coach/data/data_source/api_service.dart';
import 'package:career_coach/data/model/project_model.dart';
import 'package:career_coach/data/request_body/project_request_body.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'project_remote.g.dart';

@RestApi(baseUrl: '/api/v1/projects')
abstract class ProjectRemote {
  factory ProjectRemote(ApiService apiService) = _ProjectRemote;

  @GET('/by-user-resume/{userResumeId}')
  Future<ApiResponse<List<ProjectModel>>> getProjects({
    @Path('userResumeId') required int userResumeId,
  });

  @POST('/save-all/{userResumeId}')
  Future<ApiResponse<List<ProjectModel>>> saveProjects({
    @Path('userResumeId') required int userResumeId,
    @Body() required List<ProjectRequestBody> listProjectRequestBody,
  });
}