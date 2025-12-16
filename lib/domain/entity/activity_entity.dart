class ActivityEntity {
  final int id;
  final int userResumeId;
  int displayOrder;
  String organization;
  String position;
  String startTime;
  String endTime;
  String description;

  ActivityEntity({
    required this.id,
    required this.userResumeId,
    required this.displayOrder,
    required this.organization,
    required this.position,
    required this.startTime,
    required this.endTime,
    required this.description,
  });
}