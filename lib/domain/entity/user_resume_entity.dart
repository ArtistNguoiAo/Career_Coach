import 'package:career_coach/domain/entity/user_resume_layout_entity.dart';
import 'package:career_coach/domain/enum/type_font_family_enum.dart';
import 'package:career_coach/domain/enum/type_language_enum.dart';

class UserResumeEntity {
  final int id;
  final String title;
  final int numberOfColumns;
  final TypeLanguageEnum language;
  final TypeFontFamilyEnum fontFamily;
  final int fontSize;
  final double lineHeight;
  final String color;
  final List<UserResumeLayoutEntity> layouts;

  UserResumeEntity({
    required this.id,
    required this.title,
    required this.numberOfColumns,
    required this.language,
    required this.fontFamily,
    required this.fontSize,
    required this.lineHeight,
    required this.color,
    required this.layouts,
  });
}
