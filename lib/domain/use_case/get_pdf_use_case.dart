import 'package:career_coach/domain/repository/user_resume_repository.dart';

class GetPdfUseCase {
  final UserResumeRepository _userResumeRepository;

  GetPdfUseCase(this._userResumeRepository);

  Future<List<int>> call({
    required int id,
  }) async {
    return await _userResumeRepository.getPdf(
      id: id,
    );
  }
}