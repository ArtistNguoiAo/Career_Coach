import 'package:career_coach/domain/entity/resume_entity.dart';
import 'package:career_coach/domain/repository/resume_repository.dart';

class GetListResumePopularUseCase {
  final ResumeRepository _resumeRepository;

  GetListResumePopularUseCase(this._resumeRepository);

  Future<List<ResumeEntity>> call() async {
    return await _resumeRepository.getListResumePopular();
  }
}