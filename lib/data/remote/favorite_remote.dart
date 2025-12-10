import 'package:career_coach/data/data_source/api_response.dart';
import 'package:career_coach/data/data_source/api_service.dart';
import 'package:career_coach/data/model/favorite_model.dart';
import 'package:career_coach/data/request_body/favorite_request_body.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'favorite_remote.g.dart';

@RestApi(baseUrl: '/api/v1/favorites')
abstract class FavoriteRemote {
  factory FavoriteRemote(ApiService apiService) = _FavoriteRemote;

  @GET('/by-user-resume/{userResumeId}')
  Future<ApiResponse<List<FavoriteModel>>> getFavorites({
    @Path('userResumeId') required int userResumeId,
  });

  @POST('/save-all/{userResumeId}')
  Future<ApiResponse<List<FavoriteModel>>> saveFavorites({
    @Path('userResumeId') required int userResumeId,
    @Body() required List<FavoriteRequestBody> listFavoriteRequestBody,
  });
}