import 'package:freezed_annotation/freezed_annotation.dart';

part 'work_experience_model.freezed.dart';
part 'work_experience_model.g.dart';

@freezed
abstract class WorkExperienceModel with _$WorkExperienceModel {
  const factory WorkExperienceModel({
    @Default(0) int id,
    @Default(0) int userResumeId,
    @Default(0) int displayOrder,
    @Default('') String company,
    @Default('') String position,
    @Default('') String startTime,
    @Default('') String endTime,
    @Default('') String description,
  }) = _WorkExperienceModel;

  factory WorkExperienceModel.fromJson(Map<String, dynamic> json) => _$WorkExperienceModelFromJson(json);
}