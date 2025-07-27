import 'package:career_coach/domain/entity/auth_entity.dart';
import 'package:career_coach/data/request_body/provider_login_request_body.dart';

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
}