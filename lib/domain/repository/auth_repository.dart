import 'package:career_coach/domain/entity/auth_entity.dart';

abstract class AuthRepository {
  Future<void> register({
    required String fullName,
    required String email,
    required String phone,
    required String password,
    required String avatar,
  });

  Future<AuthEntity> login({
    required String login,
    required String password,
  });

  Future<AuthEntity> loginWithProvider({
    required String externalToken,
    required String provider,
    required String deviceInfo,
  });

  Future<void> logout({
    required String refreshToken,
  });
}