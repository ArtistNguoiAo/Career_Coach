import 'package:freezed_annotation/freezed_annotation.dart';

part 'award_model.freezed.dart';
part 'award_model.g.dart';

@freezed
abstract class AwardModel with _$AwardModel {
  const factory AwardModel({
    @Default(0) int id,
    @Default(0) int userResumeId,
    @Default(0) int displayOrder,
    @Default('') String name,
    @Default('') String awardedAt,
  }) = _AwardModel;

  factory AwardModel.fromJson(Map<String, dynamic> json) => _$AwardModelFromJson(json);
}