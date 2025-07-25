import 'package:career_coach/data/mapper/user_mapper.dart';
import 'package:career_coach/data/model/auth_model.dart';
import 'package:career_coach/domain/entity/auth_entity.dart';

class AuthMapper {
  static AuthEntity toEntity(AuthModel authModel) {
    return AuthEntity(
      accessToken: authModel.accessToken,
      refreshToken: authModel.refreshToken,
      tokenType: authModel.tokenType,
      expiresIn: authModel.expiresIn,
      user: authModel.user != null ? UserMapper.toEntity(authModel.user!) : null,
    );
  }
}