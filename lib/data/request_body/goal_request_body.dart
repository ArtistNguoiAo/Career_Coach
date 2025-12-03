class GoalRequestBody {
  final int id;
  final int userResumeId;
  final String content;

  GoalRequestBody({
    required this.id,
    required this.userResumeId,
    required this.content,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userResumeId': userResumeId,
      'content': content,
    };
  }
}