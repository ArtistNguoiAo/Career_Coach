import 'package:career_coach/data/data_source/api_response.dart';
import 'package:career_coach/data/data_source/api_service.dart';
import 'package:career_coach/data/model/contact_information_model.dart';
import 'package:career_coach/data/request_body/contact_information_request_body.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'contact_information_remote.g.dart';

@RestApi(baseUrl: '/api/v1/contact-informations')
abstract class ContactInformationRemote {
  factory ContactInformationRemote(ApiService apiService) = _ContactInformationRemote;

  @GET('/by-user-resume/{userResumeId}')
  Future<ApiResponse<ContactInformationModel>> getContactInformation({
    @Path('userResumeId') required int userResumeId,
  });

  @POST('/save')
  Future<ApiResponse<ContactInformationModel>> saveContactInformation({
    @Body() required ContactInformationRequestBody contactInformationRequestBody,
  });
}