import 'package:career_coach/data/data_source/auth_data_source.dart';
import 'package:career_coach/data/request_body/register_request_body.dart';
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
  }) {
    return _authDataSource.register(
      registerRequestBody: RegisterRequestBody(
        fullName: fullName,
        email: email,
        phone: phone,
        password: password,
        avatar: avatar,
      ),
    );
  }

}