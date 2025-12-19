import 'package:freezed_annotation/freezed_annotation.dart';

part 'avatar_model.freezed.dart';
part 'avatar_model.g.dart';

@freezed
abstract class AvatarModel with _$AvatarModel {
  const factory AvatarModel({
    @Default(0) int id,
    @Default(0) int userResumeId,
    @Default('') String alt,
    @Default('') String filename,
    @Default('') String url,
  }) = _AvatarModel;

  factory AvatarModel.fromJson(Map<String, dynamic> json) => _$AvatarModelFromJson(json);
}