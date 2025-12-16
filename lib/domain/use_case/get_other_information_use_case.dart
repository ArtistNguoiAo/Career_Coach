import 'package:career_coach/domain/entity/other_information_entity.dart';
import 'package:career_coach/domain/repository/other_information_repository.dart';

class GetOtherInformationUseCase {
  final OtherInformationRepository _otherInformationRepository;

  GetOtherInformationUseCase(this._otherInformationRepository);

  Future<OtherInformationEntity> call({required int userResumeId}) async {
    return await _otherInformationRepository.getOtherInformation(
      userResumeId: userResumeId,
    );
  }
}