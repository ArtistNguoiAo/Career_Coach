import 'package:career_coach/data/data_source/api_response.dart';
import 'package:career_coach/data/data_source/api_service.dart';
import 'package:career_coach/data/model/certificate_model.dart';
import 'package:career_coach/data/request_body/certificate_request_body.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'certificate_remote.g.dart';

@RestApi(baseUrl: '/api/v1/certificates')
abstract class CertificateRemote {
  factory CertificateRemote(ApiService apiService) = _CertificateRemote;

  @GET('/by-user-resume/{userResumeId}')
  Future<ApiResponse<List<CertificateModel>>> getCertificates({
    @Path('userResumeId') required int userResumeId,
  });

  @POST('/save-all/{userResumeId}')
  Future<ApiResponse<List<CertificateModel>>> saveCertificates({
    @Path('userResumeId') required int userResumeId,
    @Body() required List<CertificateRequestBody> listCertificateRequestBody,
  });
}