import 'package:career_coach/data/model/user_model.dart';
import 'package:career_coach/domain/entity/user_entity.dart';

class UserMapper {
  static UserEntity toEntity(UserModel userModel) {
    return UserEntity(
      id: userModel.id,
      keycloakId: userModel.keycloakId,
      fullName: userModel.fullName,
      email: userModel.email,
      phone: userModel.phone,
      avatar: userModel.avatar,
    );
  }
}