import 'package:career_coach/data/model/resume_model.dart';
import 'package:career_coach/domain/entity/resume_entity.dart';
import 'package:career_coach/domain/enum/type_resume_enum.dart';

class ResumeMapper {
  static ResumeEntity toEntity(ResumeModel resumeModel) {
    return ResumeEntity(
      id: resumeModel.id,
      title: resumeModel.title,
      description: resumeModel.description,
      thumbnailUrl: resumeModel.thumbnailUrl,
      type: TypeResumeEnumExtension.fromString(resumeModel.type.toLowerCase()),
      viewCount: resumeModel.viewCount,
      downloadCount: resumeModel.downloadCount,
    );
  }
}