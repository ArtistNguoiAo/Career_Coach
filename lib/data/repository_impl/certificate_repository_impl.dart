import 'package:career_coach/data/mapper/certificate_mapper.dart';
import 'package:career_coach/data/remote/certificate_remote.dart';
import 'package:career_coach/data/request_body/certificate_request_body.dart';
import 'package:career_coach/domain/entity/certificate_entity.dart';
import 'package:career_coach/domain/repository/certificate_repository.dart';

class CertificateRepositoryImpl implements CertificateRepository {
  final CertificateRemote _certificateRemote;

  CertificateRepositoryImpl(this._certificateRemote);

  @override
  Future<List<CertificateEntity>> getCertificates({required int userResumeId}) async {
    final response = await _certificateRemote.getCertificates(userResumeId: userResumeId);
    return response.data.map(CertificateMapper.toEntity).toList();
  }

  @override
  Future<List<CertificateEntity>> saveCertificates({
    required int userResumeId,
    required List<CertificateEntity> listCertificate,
  }) async {
    final response = await _certificateRemote.saveCertificates(
      userResumeId: userResumeId,
      listCertificateRequestBody: listCertificate
          .map(
            (e) => CertificateRequestBody(
              id: e.id,
              userResumeId: e.userResumeId,
              displayOrder: e.displayOrder,
              name: e.name,
              certificatedAt: e.certificatedAt,
              certificateLink: e.certificateLink,
            ),
          )
          .toList(),
    );
    return response.data.map(CertificateMapper.toEntity).toList();
  }
}
