import 'package:freezed_annotation/freezed_annotation.dart';

part 'analysis_model.freezed.dart';
part 'analysis_model.g.dart';

@freezed
abstract class AnalysisModel with _$AnalysisModel {
  const factory AnalysisModel({
    @Default(0) int id,
    @Default(0) int sessionId,
    @Default(0.0) double overallScore,
    @Default(0.0) double technicalScore,
    @Default(0.0) double communicationScore,
    @Default(0.0) double confidenceScore,
    @Default('') String strengths,
    @Default('') String weaknesses,
    @Default('') String detailedFeedback,
    @Default('') String recommendations,
    @Default('') String keywordMatches,
    @Default('') String analysisStatus,
    @Default('') String createdAt,
    @Default('') String updatedAt,
  }) = _AnalysisModel;

  factory AnalysisModel.fromJson(Map<String, dynamic> json) => _$AnalysisModelFromJson(json);
}