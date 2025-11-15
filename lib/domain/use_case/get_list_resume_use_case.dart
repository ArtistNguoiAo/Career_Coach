import 'package:career_coach/domain/entity/resume_entity.dart';
import 'package:career_coach/domain/repository/resume_repository.dart';

class GetListResumeUseCase {
  final ResumeRepository _resumeRepository;

  GetListResumeUseCase(this._resumeRepository);

  Future<List<ResumeEntity>> call({
    required int page,
    required int size,
    required String type,
  }) async {
    return await _resumeRepository.getListResume(
      page: page,
      size: size,
      type: type,
    );
  }
}