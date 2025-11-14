import 'package:career_coach/data/data_source/api_response.dart';
import 'package:career_coach/data/data_source/api_service.dart';
import 'package:career_coach/data/model/resume_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'resume_remote.g.dart';

@RestApi(baseUrl: '/api/v1/resumes')
abstract class ResumeRemote {
  factory ResumeRemote(ApiService apiService) = _ResumeRemote;

  @GET('')
  Future<ApiResponse<Page<ResumeModel>>> getListResume({
    @Query('page') required int page,
    @Query('size') required int size,
    @Query('type') required String type,
  });
}