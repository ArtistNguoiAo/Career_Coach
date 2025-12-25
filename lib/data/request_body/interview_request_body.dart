class InterviewRequestBody {
  final String cvSource;
  int? userResumeId;
  final String experienceLevel;
  final String language;

  InterviewRequestBody({
    required this.cvSource,
    this.userResumeId,
    required this.experienceLevel,
    required this.language,
  });

  Map<String, dynamic> toJson() {
    return {
      'cvSource': cvSource,
      'userResumeId': userResumeId,
      'experienceLevel': experienceLevel,
      'language': language,
    };
  }
}
