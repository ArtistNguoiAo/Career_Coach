import 'package:career_coach/data/data_source/api_response.dart';
import 'package:career_coach/data/data_source/api_service.dart';
import 'package:career_coach/data/model/auth_model.dart';
import 'package:career_coach/data/request_body/login_request_body.dart';
import 'package:career_coach/data/request_body/logout_request_body.dart';
import 'package:career_coach/data/request_body/provider_login_request_body.dart';
import 'package:career_coach/data/request_body/refresh_request_body.dart';
import 'package:career_coach/data/request_body/register_request_body.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_remote.g.dart';

@RestApi(baseUrl: '/api/v1/auth')
abstract class AuthRemote {
  factory AuthRemote(ApiService apiService) = _AuthRemote;

  @POST('/sign-up')
  Future<ApiResponse<void>> register({
    @Body() required RegisterRequestBody registerRequestBody,
  });

  @POST('/sign-in')
  Future<ApiResponse<AuthModel>> login({
    @Body() required LoginRequestBody loginRequestBody,
  });

  @POST('/token-exchange')
  Future<ApiResponse<AuthModel>> loginWithProvider({
    @Body() required ProviderLoginRequestBody providerLoginRequestBody,
  });

  @POST('/logout')
  Future<ApiResponse<void>> logout({
    @Body() required LogoutRequestBody logoutRequestBody,
  });

  @POST('/refresh')
  Future<ApiResponse<AuthModel>> refresh({
    @Body() required RefreshRequestBody refreshRequestBody,
  });
}