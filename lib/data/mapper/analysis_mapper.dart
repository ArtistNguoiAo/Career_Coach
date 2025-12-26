import 'package:career_coach/data/model/analysis_model.dart';
import 'package:career_coach/domain/entity/analysis_entity.dart';

class AnalysisMapper {
  static AnalysisEntity toEntity(AnalysisModel activityModel) {
    return AnalysisEntity(
      id: activityModel.id,
      sessionId: activityModel.sessionId,
      overallScore: activityModel.overallScore,
      technicalScore: activityModel.technicalScore,
      communicationScore: activityModel.communicationScore,
      confidenceScore: activityModel.confidenceScore,
      strengths: activityModel.strengths,
      weaknesses: activityModel.weaknesses,
      detailedFeedback: activityModel.detailedFeedback,
      recommendations: activityModel.recommendations,
      keywordMatches: activityModel.keywordMatches,
      analysisStatus: activityModel.analysisStatus,
      createdAt: activityModel.createdAt,
      updatedAt: activityModel.updatedAt,
    );
  }
}