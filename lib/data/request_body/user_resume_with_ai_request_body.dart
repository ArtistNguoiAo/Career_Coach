class UserResumeWithAiRequestBody {
  final String content;
  final int? sourceUserResumeId;

  UserResumeWithAiRequestBody({
    required this.content,
    this.sourceUserResumeId,
  });

  Map<String, dynamic> toJson() {
    return {
      'content': content,
      'sourceUserResumeId': sourceUserResumeId,
    };
  }
}
