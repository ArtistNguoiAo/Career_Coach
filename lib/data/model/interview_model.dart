import 'package:freezed_annotation/freezed_annotation.dart';

part 'interview_model.freezed.dart';
part 'interview_model.g.dart';

@freezed
abstract class InterviewModel with _$InterviewModel {
  const factory InterviewModel({
    @Default(0) int id,
    @Default("") String userId,
    @Default(0) int userResumeId,
    @Default("") String uploadedCvPath,
    @Default("") String cvSource,
    @Default("") String experienceLevel,
    @Default("") String status,
    @Default("") String language,
    @Default("") String conversationContext,
    @Default("") String startTime,
    @Default("") String endTime,
    @Default(0) int totalMessages,
  }) = _InterviewModel;

  factory InterviewModel.fromJson(Map<String, dynamic> json) => _$InterviewModelFromJson(json);
}