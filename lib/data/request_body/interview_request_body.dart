class InterviewRequestBody {
  final String cvSource;
  final int userResumeId;
  final String experienceLevel;
  final String language;

  InterviewRequestBody({
    required this.cvSource,
    required this.userResumeId,
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
