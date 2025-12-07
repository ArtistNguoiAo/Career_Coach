class ActivityRequestBody {
  final int id;
  final int userResumeId;
  final int displayOrder;
  final String organization;
  final String position;
  final String startTime;
  final String endTime;
  final String description;

  ActivityRequestBody({
    required this.id,
    required this.userResumeId,
    required this.displayOrder,
    required this.organization,
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
      'organization': organization,
      'position': position,
      'startTime': startTime,
      'endTime': endTime,
      'description': description,
    };
  }
}
