import 'package:career_coach/data/api_response/base_data_source.dart';
import 'package:career_coach/data/request_body/register_request_body.dart';

class AuthDataSource {
  final BaseDataSource _baseDataSource;
  AuthDataSource(this._baseDataSource);

  Future<void> register({
    required RegisterRequestBody registerRequestBody,
  }) async {
    return await _baseDataSource.post<void>(
      '/auth/sign-up',
      data: registerRequestBody.toJson(),
      fromJsonT: (json) => json['data'],
    );
  }
}