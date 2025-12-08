import 'package:freezed_annotation/freezed_annotation.dart';

part 'activity_model.freezed.dart';
part 'activity_model.g.dart';

@freezed
abstract class ActivityModel with _$ActivityModel {
  const factory ActivityModel({
    @Default(0) int id,
    @Default(0) int userResumeId,
    @Default(0) int displayOrder,
    @Default('') String organization,
    @Default('') String position,
    @Default('') String startTime,
    @Default('') String endTime,
    @Default('') String description,
  }) = _ActivityModel;

  factory ActivityModel.fromJson(Map<String, dynamic> json) => _$ActivityModelFromJson(json);
}