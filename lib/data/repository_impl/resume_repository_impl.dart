import 'package:career_coach/data/mapper/resume_mapper.dart';
import 'package:career_coach/data/remote/resume_remote.dart';
import 'package:career_coach/domain/entity/resume_entity.dart';
import 'package:career_coach/domain/repository/resume_repository.dart';

class ResumeRepositoryImpl implements ResumeRepository {
  final ResumeRemote _resumeRemote;
  ResumeRepositoryImpl(this._resumeRemote);

  @override
  Future<List<ResumeEntity>> getListResume({
    required int page,
    required int size,
    required String type,
  }) async {
    final response = await _resumeRemote.getListResume(
      page: page,
      size: size,
      type: type,
    );
    return response.data.content.map(ResumeMapper.toEntity).toList();
  }

  @override
  Future<List<ResumeEntity>> getListResumePopular() async {
    final response = await _resumeRemote.getListResumePopular();
    return response.data.map(ResumeMapper.toEntity).toList();
  }

  @override
  Future<String> downloadResume({
    required int id,
  }) async {
    final response = await _resumeRemote.downloadResume(id: id);
    return response.data;
  }
}
