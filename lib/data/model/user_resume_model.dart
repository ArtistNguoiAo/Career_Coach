import 'package:career_coach/data/model/user_resume_layout_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_resume_model.freezed.dart';
part 'user_resume_model.g.dart';

@freezed
abstract class UserResumeModel with _$UserResumeModel {
  const factory UserResumeModel({
    @Default(0) int id,
    @Default('') String title,
    @Default(0) int numberOfColumns,
    @Default('VIETNAMESE') String language,
    @Default('ARIAL') String fontFamily,
    @Default(16) int fontSize,
    @Default(1.0) double lineHeight,
    @Default('#000000') String color,
    @Default([]) List<UserResumeLayoutModel> layouts,
  }) = _UserResumeModel;

  factory UserResumeModel.fromJson(Map<String, dynamic> json) => _$UserResumeModelFromJson(json);
}