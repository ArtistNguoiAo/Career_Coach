import 'package:career_coach/data/model/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_model.freezed.dart';
part 'auth_model.g.dart';

@freezed
abstract class AuthModel with _$AuthModel {
  const factory AuthModel({
    @Default('') String accessToken,
    @Default('') String refreshToken,
    @Default('') String tokenType,
    @Default(0) int expiresIn,
    UserModel? user,
  }) = _AuthModel;

  factory AuthModel.fromJson(Map<String, dynamic> json) => _$AuthModelFromJson(json);
}