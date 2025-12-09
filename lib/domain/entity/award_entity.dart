class AwardEntity {
  final int id;
  final int userResumeId;
  int displayOrder;
  String name;
  String awardedAt;

  AwardEntity({
    required this.id,
    required this.userResumeId,
    required this.displayOrder,
    required this.name,
    required this.awardedAt,
  });
}