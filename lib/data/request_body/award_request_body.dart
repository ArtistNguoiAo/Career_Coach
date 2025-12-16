class AwardRequestBody {
  final int id;
  final int userResumeId;
  final int displayOrder;
  final String name;
  final String awardedAt;

  AwardRequestBody({
    required this.id,
    required this.userResumeId,
    required this.displayOrder,
    required this.name,
    required this.awardedAt,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userResumeId': userResumeId,
      'displayOrder': displayOrder,
      'name': name,
      'awardedAt': awardedAt,
    };
  }
}
