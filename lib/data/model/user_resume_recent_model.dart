import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_resume_recent_model.freezed.dart';
part 'user_resume_recent_model.g.dart';

@freezed
abstract class UserResumeRecentModel with _$UserResumeRecentModel {
  const factory UserResumeRecentModel({
    @Default(0) int id,
    @Default('') String title,
    @Default('') String createdAt,
  }) = _UserResumeRecentModel;

  factory UserResumeRecentModel.fromJson(Map<String, dynamic> json) => _$UserResumeRecentModelFromJson(json);
}