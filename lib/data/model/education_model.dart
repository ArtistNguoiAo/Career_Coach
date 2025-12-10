import 'package:freezed_annotation/freezed_annotation.dart';

part 'education_model.freezed.dart';
part 'education_model.g.dart';

@freezed
abstract class EducationModel with _$EducationModel {
  const factory EducationModel({
    @Default(0) int id,
    @Default(0) int userResumeId,
    @Default(0) int displayOrder,
    @Default('') String school,
    @Default('') String degree,
    @Default('') String major,
    @Default('') String startTime,
    @Default('') String endTime,
    @Default('') String description,
  }) = _EducationModel;

  factory EducationModel.fromJson(Map<String, dynamic> json) => _$EducationModelFromJson(json);
}