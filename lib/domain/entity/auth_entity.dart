import 'package:career_coach/domain/entity/user_entity.dart';

class AuthEntity {
  final String accessToken;
  final String refreshToken;
  final String tokenType;
  final int expiresIn;
  UserEntity? user;

  AuthEntity({
    required this.accessToken,
    required this.refreshToken,
    required this.tokenType,
    required this.expiresIn,
    this.user,
  });
}
