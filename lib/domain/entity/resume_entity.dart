import 'package:career_coach/domain/enum/type_resume_enum.dart';

class ResumeEntity {
  final int id;
  final String title;
  final String description;
  final String thumbnailUrl;
  final TypeResumeEnum type;
  final int viewCount;
  final int downloadCount;

  ResumeEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.thumbnailUrl,
    required this.type,
    required this.viewCount,
    required this.downloadCount,
  });
}
