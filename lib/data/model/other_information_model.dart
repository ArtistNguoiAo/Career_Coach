import 'package:freezed_annotation/freezed_annotation.dart';

part 'other_information_model.freezed.dart';
part 'other_information_model.g.dart';

@freezed
abstract class OtherInformationModel with _$OtherInformationModel {
  const factory OtherInformationModel({
    @Default(0) int id,
    @Default(0) int userResumeId,
    @Default('') String content,
  }) = _OtherInformationModel;

  factory OtherInformationModel.fromJson(Map<String, dynamic> json) => _$OtherInformationModelFromJson(json);
}