import 'package:career_coach/data/api_response/base_data_source.dart';
import 'package:career_coach/data/model/auth_model.dart';
import 'package:career_coach/data/request_body/login_request_body.dart';
import 'package:career_coach/data/request_body/logout_request_body.dart';
import 'package:career_coach/data/request_body/register_request_body.dart';

import '../request_body/provider_login_request_body.dart';
import '../request_body/refresh_request_body.dart';

class AuthDataSource {
  final BaseDataSource _baseDataSource;

  AuthDataSource(this._baseDataSource);

  Future<void> register({required RegisterRequestBody registerRequestBody}) async {
    return await _baseDataSource.post<void>(
      '/auth/sign-up',
      data: registerRequestBody.toJson(),
      fromJsonT: (json) => json,
    );
  }

  Future<AuthModel> login({required LoginRequestBody loginRequestBody}) async {
    return await _baseDataSource.post<AuthModel>(
      '/auth/sign-in',
      data: loginRequestBody.toJson(),
      fromJsonT: (json) => json != null ? AuthModel.fromJson(json) : AuthModel(),
      useToken: false,
    );
  }

  Future<void> logout({required LogoutRequestBody logoutRequestBody}) async {
    return await _baseDataSource.post<void>(
      '/auth/logout',
      data: logoutRequestBody.toJson(),
      fromJsonT: (json) => json,
    );
  }

  Future<AuthModel> refresh({required RefreshRequestBody refreshRequestBody}) async {
    return await _baseDataSource.post<AuthModel>(
      '/auth/refresh',
      data: refreshRequestBody.toJson(),
      fromJsonT: (json) {
        if (json == null) return AuthModel();
        final data = json['data'];
        return data != null ? AuthModel.fromJson(data) : AuthModel();
      },
      useToken: false,
    );
  }

  Future<AuthModel> loginWithProvider({required ProviderLoginRequestBody providerLoginRequestBody}) async {
    return await _baseDataSource.post<AuthModel>(
      '/auth/token-exchange',
      data: providerLoginRequestBody.toJson(),
      fromJsonT: (json) {
        if (json == null) return AuthModel();
        final data = json['data'];
        return data != null ? AuthModel.fromJson(data) : AuthModel();
      },
      useToken: false,
    );
  }
}
