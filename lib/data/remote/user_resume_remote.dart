import 'package:career_coach/data/data_source/api_response.dart';
import 'package:career_coach/data/data_source/api_service.dart';
import 'package:career_coach/data/model/user_resume_recent_model.dart';
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
}