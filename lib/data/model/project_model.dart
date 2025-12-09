import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_model.freezed.dart';
part 'project_model.g.dart';

@freezed
abstract class ProjectModel with _$ProjectModel {
  const factory ProjectModel({
    @Default(0) int id,
    @Default(0) int userResumeId,
    @Default(0) int displayOrder,
    @Default('') String name,
    @Default('') String position,
    @Default('') String startTime,
    @Default('') String endTime,
    @Default('') String description,
  }) = _ProjectModel;

  factory ProjectModel.fromJson(Map<String, dynamic> json) => _$ProjectModelFromJson(json);
}