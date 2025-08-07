import 'package:career_coach/data/mapper/auth_mapper.dart';
import 'package:career_coach/data/remote/auth_remote.dart';
import 'package:career_coach/data/request_body/login_request_body.dart';
import 'package:career_coach/data/request_body/logout_request_body.dart';
import 'package:career_coach/data/request_body/register_request_body.dart';
import 'package:career_coach/data/request_body/provider_login_request_body.dart';
import 'package:career_coach/domain/entity/auth_entity.dart';
import 'package:career_coach/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemote _authRemote;
  AuthRepositoryImpl(this._authRemote);

  @override
  Future<void> register({
    required String fullName,
    required String email,
    required String phone,
    required String password,
    required String avatar,
  }) async {
    final response = await _authRemote.register(
      registerRequestBody: RegisterRequestBody(
        fullName: fullName,
        email: email,
        phone: phone,
        password: password,
        avatar: avatar,
      ),
    );
    return response.data;
  }

  @override
  Future<AuthEntity> login({
    required String login,
    required String password,
  }) async {
    final response = await _authRemote.login(
      loginRequestBody: LoginRequestBody(
        login: login,
        password: password,
      ),
    );
    return AuthMapper.toEntity(response.data);
  }

  @override
  Future<AuthEntity> loginWithProvider({
    required String externalToken,
    required String provider,
    required String deviceInfo,
  }) async {
    final response = await _authRemote.loginWithProvider(
      providerLoginRequestBody: ProviderLoginRequestBody(
        externalToken: externalToken,
        provider: provider,
        deviceInfo: deviceInfo,
      ),
    );
    return AuthMapper.toEntity(response.data);
  }

  @override
  Future<void> logout({
    required String refreshToken,
  }) async {
    final response = await _authRemote.logout(
      logoutRequestBody: LogoutRequestBody(
        refreshToken: refreshToken,
      ),
    );
    return response.data;
  }
}