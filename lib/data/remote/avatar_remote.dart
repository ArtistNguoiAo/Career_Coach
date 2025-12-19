import 'dart:io';
import 'package:career_coach/data/data_source/api_response.dart';
import 'package:career_coach/data/data_source/api_service.dart';
import 'package:career_coach/data/model/avatar_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'avatar_remote.g.dart';

@RestApi(baseUrl: '/api/v1/avatars')
abstract class AvatarRemote {
  factory AvatarRemote(ApiService apiService) = _AvatarRemote;

  @GET('/by-user-resume/{userResumeId}')
  Future<ApiResponse<AvatarModel>> getAvatar({
    @Path('userResumeId') required int userResumeId,
  });

  @POST('/upload')
  @MultiPart()
  Future<ApiResponse<AvatarModel>> saveAvatar({
    @Query('userResumeId') required int userResumeId,
    @Part(name: 'file', contentType: 'image/jpeg') required File file,
  });
}