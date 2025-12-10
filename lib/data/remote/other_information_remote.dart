import 'package:career_coach/data/data_source/api_response.dart';
import 'package:career_coach/data/data_source/api_service.dart';
import 'package:career_coach/data/model/other_information_model.dart';
import 'package:career_coach/data/request_body/other_information_request_body.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'other_information_remote.g.dart';

@RestApi(baseUrl: '/api/v1/other-informations')
abstract class OtherInformationRemote {
  factory OtherInformationRemote(ApiService apiService) = _OtherInformationRemote;

  @GET('/by-user-resume/{userResumeId}')
  Future<ApiResponse<OtherInformationModel>> getOtherInformation({
    @Path('userResumeId') required int userResumeId,
  });

  @POST('/save')
  Future<ApiResponse<OtherInformationModel>> saveOtherInformation({
    @Body() required OtherInformationRequestBody otherInformationRequestBody,
  });
}