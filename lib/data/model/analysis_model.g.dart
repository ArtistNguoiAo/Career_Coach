// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analysis_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AnalysisModel _$AnalysisModelFromJson(Map<String, dynamic> json) =>
    _AnalysisModel(
      id: (json['id'] as num?)?.toInt() ?? 0,
      sessionId: (json['sessionId'] as num?)?.toInt() ?? 0,
      overallScore: (json['overallScore'] as num?)?.toDouble() ?? 0.0,
      technicalScore: (json['technicalScore'] as num?)?.toDouble() ?? 0.0,
      communicationScore:
          (json['communicationScore'] as num?)?.toDouble() ?? 0.0,
      confidenceScore: (json['confidenceScore'] as num?)?.toDouble() ?? 0.0,
      strengths: json['strengths'] as String? ?? '',
      weaknesses: json['weaknesses'] as String? ?? '',
      detailedFeedback: json['detailedFeedback'] as String? ?? '',
      recommendations: json['recommendations'] as String? ?? '',
      keywordMatches: json['keywordMatches'] as String? ?? '',
      analysisStatus: json['analysisStatus'] as String? ?? '',
      createdAt: json['createdAt'] as String? ?? '',
      updatedAt: json['updatedAt'] as String? ?? '',
    );

Map<String, dynamic> _$AnalysisModelToJson(_AnalysisModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sessionId': instance.sessionId,
      'overallScore': instance.overallScore,
      'technicalScore': instance.technicalScore,
      'communicationScore': instance.communicationScore,
      'confidenceScore': instance.confidenceScore,
      'strengths': instance.strengths,
      'weaknesses': instance.weaknesses,
      'detailedFeedback': instance.detailedFeedback,
      'recommendations': instance.recommendations,
      'keywordMatches': instance.keywordMatches,
      'analysisStatus': instance.analysisStatus,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };
