import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_information_model.freezed.dart';
part 'contact_information_model.g.dart';

@freezed
abstract class ContactInformationModel with _$ContactInformationModel {
  const factory ContactInformationModel({
    @Default(0) int id,
    @Default(0) int userResumeId,
    @Default('') String fullName,
    @Default('') String position,
    @Default('') String email,
    @Default('') String phoneNumber,
    @Default('') String address,
    @Default('') String dateOfBirth,
    @Default('') String portfolio,
    @Default('') String github,
    @Default('') String linkedIn,
    @Default('') String facebook,
  }) = _ContactInformationModel;

  factory ContactInformationModel.fromJson(Map<String, dynamic> json) => _$ContactInformationModelFromJson(json);
}