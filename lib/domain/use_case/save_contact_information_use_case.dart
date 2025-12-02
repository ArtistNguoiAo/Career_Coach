import 'package:career_coach/domain/entity/contact_information_entity.dart';
import 'package:career_coach/domain/repository/contact_information_repository.dart';

class SaveContactInformationUseCase {
  final ContactInformationRepository _contactInformationRepository;

  SaveContactInformationUseCase(this._contactInformationRepository);

  Future<ContactInformationEntity> call({required ContactInformationEntity contactInformationEntity}) async {
    return await _contactInformationRepository.saveContactInformation(
      contactInformationEntity: contactInformationEntity,
    );
  }
}