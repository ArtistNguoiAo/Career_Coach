class ProjectEntity {
  final int id;
  final int userResumeId;
  int displayOrder;
  String name;
  String position;
  String startTime;
  String endTime;
  String description;

  ProjectEntity({
    required this.id,
    required this.userResumeId,
    required this.displayOrder,
    required this.name,
    required this.position,
    required this.startTime,
    required this.endTime,
    required this.description,
  });
}