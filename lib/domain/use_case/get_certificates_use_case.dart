import 'package:career_coach/domain/entity/certificate_entity.dart';
import 'package:career_coach/domain/repository/certificate_repository.dart';

class GetCertificatesUseCase {
  final CertificateRepository _certificateRepository;

  GetCertificatesUseCase(this._certificateRepository);

  Future<List<CertificateEntity>> call({required int userResumeId}) async {
    return await _certificateRepository.getCertificates(
      userResumeId: userResumeId,
    );
  }
}