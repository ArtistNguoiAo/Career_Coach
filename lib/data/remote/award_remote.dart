import 'package:career_coach/data/data_source/api_response.dart';
import 'package:career_coach/data/data_source/api_service.dart';
import 'package:career_coach/data/model/award_model.dart';
import 'package:career_coach/data/request_body/award_request_body.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'award_remote.g.dart';

@RestApi(baseUrl: '/api/v1/awards')
abstract class AwardRemote {
  factory AwardRemote(ApiService apiService) = _AwardRemote;

  @GET('/by-user-resume/{userResumeId}')
  Future<ApiResponse<List<AwardModel>>> getAwards({
    @Path('userResumeId') required int userResumeId,
  });

  @POST('/save-all/{userResumeId}')
  Future<ApiResponse<List<AwardModel>>> saveAwards({
    @Path('userResumeId') required int userResumeId,
    @Body() required List<AwardRequestBody> listAwardRequestBody,
  });
}