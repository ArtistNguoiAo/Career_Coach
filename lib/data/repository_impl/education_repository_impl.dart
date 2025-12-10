import 'package:career_coach/data/mapper/education_mapper.dart';
import 'package:career_coach/data/remote/education_remote.dart';
import 'package:career_coach/data/request_body/education_request_body.dart';
import 'package:career_coach/domain/entity/education_entity.dart';
import 'package:career_coach/domain/repository/education_repository.dart';

class EducationRepositoryImpl implements EducationRepository {
  final EducationRemote _educationRemote;

  EducationRepositoryImpl(this._educationRemote);

  @override
  Future<List<EducationEntity>> getEducations({required int userResumeId}) async {
    final response = await _educationRemote.getEducations(userResumeId: userResumeId);
    return response.data.map(EducationMapper.toEntity).toList();
  }

  @override
  Future<List<EducationEntity>> saveEducations({
    required int userResumeId,
    required List<EducationEntity> listEducation,
  }) async {
    final response = await _educationRemote.saveEducations(
      userResumeId: userResumeId,
      listEducationRequestBody: listEducation.map((e) =>
          EducationRequestBody(
              id: e.id,
              userResumeId: e.userResumeId,
              displayOrder: e.displayOrder,
              school: e.school,
              degree: e.degree,
              major: e.major,
              startTime: e.startTime,
              endTime: e.endTime,
              description: e.description
          )
      ).toList(),
    );
    return response.data.map(EducationMapper.toEntity).toList();
  }
}
