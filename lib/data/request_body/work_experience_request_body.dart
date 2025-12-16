class WorkExperienceRequestBody {
  final int id;
  final int userResumeId;
  final int displayOrder;
  final String company;
  final String position;
  final String startTime;
  final String endTime;
  final String description;

  WorkExperienceRequestBody({
    required this.id,
    required this.userResumeId,
    required this.displayOrder,
    required this.company,
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
      'company': company,
      'position': position,
      'startTime': startTime,
      'endTime': endTime,
      'description': description,
    };
  }
}
