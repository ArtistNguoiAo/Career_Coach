import 'dart:io';

import 'package:career_coach/data/data_source/api_response.dart';
import 'package:career_coach/data/data_source/api_service.dart';
import 'package:career_coach/data/model/user_model.dart';
import 'package:career_coach/data/request_body/update_profile_request_body.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'user_remote.g.dart';

@RestApi(baseUrl: '/api/v1/user')
abstract class UserRemote {
  factory UserRemote(ApiService apiService) = _UserRemote;

  @GET('/profile')
  Future<ApiResponse<UserModel>> getProfile();

  @MultiPart()
  @POST('/profile')
  Future<ApiResponse<UserModel>> updateAvatar({
    @Part(name: 'avatar') required File avatar,
  });

  @PUT('/profile')
  Future<ApiResponse<UserModel>> updateProfile({
    @Body() required UpdateProfileRequestBody updateProfileRequestBody,
  });
}
