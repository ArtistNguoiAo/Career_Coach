import 'package:career_coach/data/model/resume_model.dart';
import 'package:career_coach/domain/entity/resume_entity.dart';
import 'package:career_coach/domain/enum/type_resume_enum.dart';
import 'package:career_coach/domain/enum/type_resume_section_enum.dart';

class ResumeMapper {
  static ResumeEntity toEntity(ResumeModel resumeModel) {
    return ResumeEntity(
      id: resumeModel.id,
      title: resumeModel.title,
      description: resumeModel.description,
      thumbnailUrl: resumeModel.thumbnailUrl,
      type: TypeResumeEnumExtension.fromString(resumeModel.type),
      viewCount: resumeModel.viewCount,
      downloadCount: resumeModel.downloadCount,
      sections: resumeModel.sections
          .map((section) => TypeResumeSectionEnumExtension.fromString(section))
          .toList(),
    );
  }
}