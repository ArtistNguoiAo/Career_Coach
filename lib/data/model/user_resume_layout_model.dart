import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_resume_layout_model.freezed.dart';
part 'user_resume_layout_model.g.dart';

@freezed
abstract class UserResumeLayoutModel with _$UserResumeLayoutModel {
  const factory UserResumeLayoutModel({
    @Default(0) int id,
    @Default('') String side,
    @Default([]) List<String> sections,
    @Default(0.0) double widthPercentage,
  }) = _UserResumeLayoutModel;

  factory UserResumeLayoutModel.fromJson(Map<String, dynamic> json) => _$UserResumeLayoutModelFromJson(json);
}