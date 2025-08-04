import 'package:career_coach/data/api_response/base_data_source.dart';
import 'package:career_coach/data/model/user_model.dart';
import 'package:career_coach/data/request_body/update_avatar_request_body.dart';

class UserDataSource {
  final BaseDataSource _baseDataSource;

  UserDataSource(this._baseDataSource);

  Future<UserModel> getProfile() async {
    return await _baseDataSource.get<UserModel>(
      '/user/profile',
      fromJsonT: (json) =>
          json != null ? UserModel.fromJson(json) : UserModel(),
    );
  }

  Future<UserModel> updateAvatar({
    required UpdateAvatarRequestBody updateAvatarRequestBody,
  }) async {
    return await _baseDataSource.post<UserModel>(
      '/user/avatar',
      data: updateAvatarRequestBody.toFormData(),
      fromJsonT: (json) =>
          json != null ? UserModel.fromJson(json) : UserModel(),
      isFormData: true,
    );
  }
}
