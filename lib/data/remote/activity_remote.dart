import 'package:career_coach/data/data_source/api_response.dart';
import 'package:career_coach/data/data_source/api_service.dart';
import 'package:career_coach/data/model/activity_model.dart';
import 'package:career_coach/data/request_body/activity_request_body.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'activity_remote.g.dart';

@RestApi(baseUrl: '/api/v1/activities')
abstract class ActivityRemote {
  factory ActivityRemote(ApiService apiService) = _ActivityRemote;

  @GET('/by-user-resume/{userResumeId}')
  Future<ApiResponse<List<ActivityModel>>> getActivities({
    @Path('userResumeId') required int userResumeId,
  });

  @POST('/save-all/{userResumeId}')
  Future<ApiResponse<List<ActivityModel>>> saveActivities({
    @Path('userResumeId') required int userResumeId,
    @Body() required List<ActivityRequestBody> listActivityRequestBody,
  });
}