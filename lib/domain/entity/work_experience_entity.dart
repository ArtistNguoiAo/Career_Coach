class WorkExperienceEntity {
  final int id;
  final int userResumeId;
  int displayOrder;
  String company;
  String position;
  String startTime;
  String endTime;
  String description;

  WorkExperienceEntity({
    required this.id,
    required this.userResumeId,
    required this.displayOrder,
    required this.company,
    required this.position,
    required this.startTime,
    required this.endTime,
    required this.description,
  });
}