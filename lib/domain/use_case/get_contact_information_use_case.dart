import 'package:career_coach/domain/entity/contact_information_entity.dart';
import 'package:career_coach/domain/repository/contact_information_repository.dart';

class GetContactInformationUseCase {
  final ContactInformationRepository _contactInformationRepository;

  GetContactInformationUseCase(this._contactInformationRepository);

  Future<ContactInformationEntity> call({required int userResumeId}) async {
    return await _contactInformationRepository.getContactInformation(
      userResumeId: userResumeId,
    );
  }
}