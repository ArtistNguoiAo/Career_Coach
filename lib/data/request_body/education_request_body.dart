class EducationRequestBody {
  final int id;
  final int userResumeId;
  final int displayOrder;
  final String school;
  final String degree;
  final String major;
  final String startTime;
  final String endTime;
  final String description;

  EducationRequestBody({
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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userResumeId': userResumeId,
      'displayOrder': displayOrder,
      'school': school,
      'degree': degree,
      'major': major,
      'startTime': startTime,
      'endTime': endTime,
      'description': description,
    };
  }
}
