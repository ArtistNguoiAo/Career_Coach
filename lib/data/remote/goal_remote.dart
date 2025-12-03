import 'package:career_coach/data/data_source/api_response.dart';
import 'package:career_coach/data/data_source/api_service.dart';
import 'package:career_coach/data/model/goal_model.dart';
import 'package:career_coach/data/request_body/goal_request_body.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'goal_remote.g.dart';

@RestApi(baseUrl: '/api/v1/goals')
abstract class GoalRemote {
  factory GoalRemote(ApiService apiService) = _GoalRemote;

  @GET('/by-user-resume/{userResumeId}')
  Future<ApiResponse<GoalModel>> getGoal({
    @Path('userResumeId') required int userResumeId,
  });

  @POST('/save')
  Future<ApiResponse<GoalModel>> saveGoal({
    @Body() required GoalRequestBody goalRequestBody,
  });
}