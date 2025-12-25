import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_interview_model.freezed.dart';
part 'create_interview_model.g.dart';

@freezed
abstract class CreateInterviewModel with _$CreateInterviewModel {
  const factory CreateInterviewModel({
    @Default(0) int sessionId,
    @Default("") String experienceLevel,
    @Default("") String status,
    @Default("") String initialMessage,
    @Default("") String startedAt,
  }) = _CreateInterviewModel;

  factory CreateInterviewModel.fromJson(Map<String, dynamic> json) => _$CreateInterviewModelFromJson(json);
}