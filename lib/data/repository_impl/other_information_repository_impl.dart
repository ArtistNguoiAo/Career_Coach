import 'package:career_coach/data/mapper/other_information_mapper.dart';
import 'package:career_coach/data/remote/other_information_remote.dart';
import 'package:career_coach/data/request_body/other_information_request_body.dart';
import 'package:career_coach/domain/entity/other_information_entity.dart';
import 'package:career_coach/domain/repository/other_information_repository.dart';

class OtherInformationRepositoryImpl implements OtherInformationRepository {
  final OtherInformationRemote _otherInformationRemote;

  OtherInformationRepositoryImpl(this._otherInformationRemote);

  @override
  Future<OtherInformationEntity> getOtherInformation({required int userResumeId}) async {
    final response = await _otherInformationRemote.getOtherInformation(userResumeId: userResumeId);
    return OtherInformationMapper.toEntity(response.data);
  }

  @override
  Future<OtherInformationEntity> saveOtherInformation({required OtherInformationEntity otherInformationEntity}) async {
    final response = await _otherInformationRemote.saveOtherInformation(
      otherInformationRequestBody: OtherInformationRequestBody(
        id: otherInformationEntity.id,
        userResumeId: otherInformationEntity.userResumeId,
        content: otherInformationEntity.content,
      )
    );
    return OtherInformationMapper.toEntity(response.data);
  }

}