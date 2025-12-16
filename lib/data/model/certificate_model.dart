import 'package:freezed_annotation/freezed_annotation.dart';

part 'certificate_model.freezed.dart';
part 'certificate_model.g.dart';

@freezed
abstract class CertificateModel with _$CertificateModel {
  const factory CertificateModel({
    @Default(0) int id,
    @Default(0) int userResumeId,
    @Default(0) int displayOrder,
    @Default('') String name,
    @Default('') String certificatedAt,
    @Default('') String certificateLink,
  }) = _CertificateModel;

  factory CertificateModel.fromJson(Map<String, dynamic> json) => _$CertificateModelFromJson(json);
}