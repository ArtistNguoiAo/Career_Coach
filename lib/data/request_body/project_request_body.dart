class ProjectRequestBody {
  final int id;
  final int userResumeId;
  final int displayOrder;
  final String name;
  final String position;
  final String startTime;
  final String endTime;
  final String description;

  ProjectRequestBody({
    required this.id,
    required this.userResumeId,
    required this.displayOrder,
    required this.name,
    required this.position,
    required this.startTime,
    required this.endTime,
    required this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userResumeId': userResumeId,
      'displayOrder': displayOrder,
      'name': name,
      'position': position,
      'startTime': startTime,
      'endTime': endTime,
      'description': description,
    };
  }
}
