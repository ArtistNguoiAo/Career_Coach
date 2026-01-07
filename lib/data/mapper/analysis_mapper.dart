import 'package:career_coach/data/model/analysis_model.dart';
import 'package:career_coach/domain/entity/analysis_entity.dart';
import 'package:career_coach/domain/enum/type_analysis_status_enum.dart';

class AnalysisMapper {
  static AnalysisEntity toEntity(AnalysisModel analysisModel) {
    return AnalysisEntity(
      id: analysisModel.id,
      sessionId: analysisModel.sessionId,
      overallScore: analysisModel.overallScore,
      technicalScore: analysisModel.technicalScore,
      communicationScore: analysisModel.communicationScore,
      confidenceScore: analysisModel.confidenceScore,
      strengths: analysisModel.strengths,
      weaknesses: analysisModel.weaknesses,
      detailedFeedback: analysisModel.detailedFeedback,
      recommendations: analysisModel.recommendations,
      keywordMatches: analysisModel.keywordMatches,
      analysisStatus: TypeAnalysisStatusEnumExtension.fromString(analysisModel.analysisStatus),
      createdAt: analysisModel.createdAt,
      updatedAt: analysisModel.updatedAt,
    );
  }
}