import 'package:career_coach/domain/entity/other_information_entity.dart';
import 'package:career_coach/domain/repository/other_information_repository.dart';

class SaveOtherInformationUseCase {
  final OtherInformationRepository _otherInformationRepository;

  SaveOtherInformationUseCase(this._otherInformationRepository);

  Future<OtherInformationEntity> call({required OtherInformationEntity otherInformationEntity}) async {
    return await _otherInformationRepository.saveOtherInformation(
      otherInformationEntity: otherInformationEntity,
    );
  }
}