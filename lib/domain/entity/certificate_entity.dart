class CertificateEntity {
  final int id;
  final int userResumeId;
  int displayOrder;
  String name;
  String certificatedAt;
  String certificateLink;

  CertificateEntity({
    required this.id,
    required this.userResumeId,
    required this.displayOrder,
    required this.name,
    required this.certificatedAt,
    required this.certificateLink,
  });
}