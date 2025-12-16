import 'package:career_coach/domain/entity/certificate_entity.dart';

abstract class CertificateRepository {
  Future<List<CertificateEntity>> getCertificates({
    required int userResumeId,
  });

  Future<List<CertificateEntity>> saveCertificates({
    required int userResumeId,
    required List<CertificateEntity> listCertificate,
  });
}