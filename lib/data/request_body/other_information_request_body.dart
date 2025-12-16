class OtherInformationRequestBody {
  final int id;
  final int userResumeId;
  final String content;

  OtherInformationRequestBody({
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