import 'package:career_coach/data/model/certificate_model.dart';
import 'package:career_coach/domain/entity/certificate_entity.dart';

class CertificateMapper {
  static CertificateEntity toEntity(CertificateModel certificateModel) {
    return CertificateEntity(
      id: certificateModel.id,
      userResumeId: certificateModel.userResumeId,
      displayOrder: certificateModel.displayOrder,
      name: certificateModel.name,
      certificatedAt: certificateModel.certificatedAt,
      certificateLink: certificateModel.certificateLink,
    );
  }
}