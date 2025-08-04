import 'package:career_coach/data/api_response/base_data_source.dart';
import 'package:career_coach/data/model/user_model.dart';

class UserDataSource {
  final BaseDataSource _baseDataSource;

  UserDataSource(this._baseDataSource);

  Future<UserModel> getProfile() async {
    return await _baseDataSource.get<UserModel>(
      '/user/profile',
      fromJsonT: (json) => json != null ? UserModel.fromJson(json) : UserModel(),
    );
  }
}