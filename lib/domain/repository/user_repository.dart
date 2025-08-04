import 'package:career_coach/domain/entity/user_entity.dart';

abstract class UserRepository {
  Future<UserEntity> getProfile();
}