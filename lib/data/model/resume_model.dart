import 'package:freezed_annotation/freezed_annotation.dart';

part 'resume_model.freezed.dart';
part 'resume_model.g.dart';

@freezed
abstract class ResumeModel with _$ResumeModel {
  const factory ResumeModel({
    @Default(0) int id,
    @Default('') String title,
    @Default('') String description,
    @Default('') String thumbnailUrl,
    @Default('') String type,
    @Default(0) int viewCount,
    @Default(0) int downloadCount,
  }) = _ResumeModel;

  factory ResumeModel.fromJson(Map<String, dynamic> json) => _$ResumeModelFromJson(json);
}