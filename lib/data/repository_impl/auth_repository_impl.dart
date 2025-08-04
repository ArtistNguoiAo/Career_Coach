import 'package:career_coach/data/data_source/auth_data_source.dart';
import 'package:career_coach/data/mapper/auth_mapper.dart';
import 'package:career_coach/data/request_body/login_request_body.dart';
import 'package:career_coach/data/request_body/logout_request_body.dart';
import 'package:career_coach/data/request_body/register_request_body.dart';
import 'package:career_coach/data/request_body/provider_login_request_body.dart';
import 'package:career_coach/domain/entity/auth_entity.dart';
import 'package:career_coach/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource _authDataSource;
  AuthRepositoryImpl(this._authDataSource);

  @override
  Future<void> register({
    required String fullName,
    required String email,
    required String phone,
    required String password,
    required String avatar,
  }) async {
    return await _authDataSource.register(
      registerRequestBody: RegisterRequestBody(
        fullName: fullName,
        email: email,
        phone: phone,
        password: password,
        avatar: avatar,
      ),
    );
  }

  @override
  Future<AuthEntity> login({
    required String login,
    required String password,
  }) async {
    final authModel = await _authDataSource.login(
      loginRequestBody: LoginRequestBody(
        login: login,
        password: password,
      ),
    );
    return AuthMapper.toEntity(authModel);
  }

  @override
  Future<AuthEntity> loginWithProvider({
    required String externalToken,
    required String provider,
    required String deviceInfo,
  }) async {
    final authModel = await _authDataSource.loginWithProvider(
      providerLoginRequestBody: ProviderLoginRequestBody(
        externalToken: externalToken,
        provider: provider,
        deviceInfo: deviceInfo,
      ),
    );
    return AuthMapper.toEntity(authModel);
  }

  @override
  Future<void> logout({
    required String refreshToken,
  }) async {
    return await _authDataSource.logout(
      logoutRequestBody: LogoutRequestBody(
        refreshToken: refreshToken,
      ),
    );
  }
}