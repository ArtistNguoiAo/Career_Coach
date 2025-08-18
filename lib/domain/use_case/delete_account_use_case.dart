import 'package:career_coach/domain/repository/user_repository.dart';

class DeleteAccountUseCase {
  final UserRepository _userRepository;

  DeleteAccountUseCase(this._userRepository);

  Future<void> call() async {
    return await _userRepository.deleteAccount();
  }
}