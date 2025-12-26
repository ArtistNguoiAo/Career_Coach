import 'package:career_coach/domain/repository/resume_repository.dart';

class DownloadResumeUseCase {
  final ResumeRepository _resumeRepository;

  DownloadResumeUseCase(this._resumeRepository);

  Future<String> call({
    required int id,
  }) async {
    return await _resumeRepository.downloadResume(
      id: id,
    );
  }
}