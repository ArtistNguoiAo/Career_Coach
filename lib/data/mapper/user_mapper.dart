import 'package:career_coach/data/model/user_model.dart';
import 'package:career_coach/domain/entity/user_entity.dart';

class UserMapper {
  static UserEntity toEntity(UserModel userModel) {
    return UserEntity(
      avatar: userModel.avatar,
      phone: userModel.phone,
      email: userModel.email,
      fullName: userModel.fullName,
      roles: userModel.roles,
    );
  }
}