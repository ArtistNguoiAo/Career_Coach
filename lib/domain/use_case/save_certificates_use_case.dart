import 'package:career_coach/domain/entity/certificate_entity.dart';
import 'package:career_coach/domain/repository/certificate_repository.dart';

class SaveCertificatesUseCase {
  final CertificateRepository _certificateRepository;

  SaveCertificatesUseCase(this._certificateRepository);

  Future<List<CertificateEntity>> call({
    required int userResumeId,
    required List<CertificateEntity> listCertificate,
  }) async {
    return await _certificateRepository.saveCertificates(userResumeId: userResumeId, listCertificate: listCertificate);
  }
}
