class EducationEntity {
  final int id;
  final int userResumeId;
  int displayOrder;
  String school;
  String degree;
  String major;
  String startTime;
  String endTime;
  String description;

  EducationEntity({
    required this.id,
    required this.userResumeId,
    required this.displayOrder,
    required this.school,
    required this.degree,
    required this.major,
    required this.startTime,
    required this.endTime,
    required this.description,
  });
}