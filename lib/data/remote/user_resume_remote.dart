import 'package:career_coach/data/data_source/api_response.dart';
import 'package:career_coach/data/data_source/api_service.dart';
import 'package:career_coach/data/model/user_resume_model.dart';
import 'package:career_coach/data/model/user_resume_recent_model.dart';
import 'package:career_coach/data/request_body/user_resume_request_body.dart';
import 'package:career_coach/data/request_body/user_resume_with_ai_request_body.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'user_resume_remote.g.dart';

@RestApi(baseUrl: '/api/v1/user-resumes')
abstract class UserResumeRemote {
  factory UserResumeRemote(ApiService apiService) = _UserResumeRemote;

  @GET('/recent')
  Future<ApiResponse<List<UserResumeRecentModel>>> getListUserResumeRecent({
    @Query('limit') required int limit,
  });

  @POST('/by-resume/{resumeId}')
  Future<ApiResponse<UserResumeModel>> createNewUserResume({
    @Path('resumeId') required int resumeId,
  });

  @POST('/by-resume/{resumeId}/copy/{userResumeId}')
  Future<ApiResponse<UserResumeModel>> createNewUserResumeCopy({
    @Path('resumeId') required int resumeId,
    @Path('userResumeId') required int userResumeId,
  });

  @GET('')
  Future<ApiResponse<PagedData<UserResumeModel>>> getListUserResume({
    @Query('page') required int page,
    @Query('size') required int size,
    @Query('status') required String status,
  });

  @GET('/{id}')
  Future<ApiResponse<UserResumeModel>> getDetailUserResume({
    @Path('id') required int id,
  });

  @PUT('/save/{id}')
  Future<ApiResponse<UserResumeModel>> saveUserResume({
    @Path('id') required int id,
    @Body() required UserResumeRequestBody userResumeRequestBody,
  });

  @GET('/generate/{id}')
  @DioResponseType(ResponseType.bytes)
  Future<HttpResponse<List<int>>> getPdf({
    @Path('id') required int id,
  });

  @DELETE('/{id}')
  Future<ApiResponse<void>> deleteUserResume({
    @Path('id') required int id,
  });

  @DELETE('/batch')
  Future<ApiResponse<void>> deleteUserResumeBatch({
    @Query('ids') required List<int> ids,
  });

  @POST('/ai-create')
  Future<ApiResponse<UserResumeModel>> createNewUserResumeWithAI({
    @Body() required UserResumeWithAiRequestBody userResumeWithAiRequestBody,
  });
}