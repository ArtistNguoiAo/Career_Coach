class AnalysisEntity {
  final int id;
  final int sessionId;
  final double overallScore;
  final double technicalScore;
  final double communicationScore;
  final double confidenceScore;
  final String strengths;
  final String weaknesses;
  final String detailedFeedback;
  final String recommendations;
  final String keywordMatches;
  final String analysisStatus;
  final String createdAt;
  final String updatedAt;

  AnalysisEntity({
    required this.id,
    required this.sessionId,
    required this.overallScore,
    required this.technicalScore,
    required this.communicationScore,
    required this.confidenceScore,
    required this.strengths,
    required this.weaknesses,
    required this.detailedFeedback,
    required this.recommendations,
    required this.keywordMatches,
    required this.analysisStatus,
    required this.createdAt,
    required this.updatedAt,
  });
}
