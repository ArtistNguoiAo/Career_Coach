import 'package:career_coach/domain/entity/avatar_entity.dart';
import 'package:career_coach/domain/repository/avatar_repository.dart';

class GetAvatarUseCase {
  final AvatarRepository _avatarRepository;

  GetAvatarUseCase(this._avatarRepository);

  Future<AvatarEntity> call({required int userResumeId}) async {
    return await _avatarRepository.getAvatar(userResumeId: userResumeId);
  }
}
