class CertificateRequestBody {
  final int id;
  final int userResumeId;
  final int displayOrder;
  final String name;
  final String certificatedAt;
  final String certificateLink;

  CertificateRequestBody({
    required this.id,
    required this.userResumeId,
    required this.displayOrder,
    required this.name,
    required this.certificatedAt,
    required this.certificateLink,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userResumeId': userResumeId,
      'displayOrder': displayOrder,
      'name': name,
      'certificatedAt': certificatedAt,
      'certificateLink': certificateLink,
    };
  }
}
