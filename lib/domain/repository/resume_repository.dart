import 'package:career_coach/domain/entity/resume_entity.dart';

abstract class ResumeRepository {
  Future<List<ResumeEntity>> getListResume({
    required int page,
    required int size,
    required String type,
  });
}