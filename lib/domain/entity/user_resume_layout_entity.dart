import 'package:career_coach/domain/enum/type_resume_section_enum.dart';
import 'package:career_coach/domain/enum/type_side_enum.dart';

class UserResumeLayoutEntity {
  final String id;
  final TypeSideEnum side;
  final List<TypeResumeSectionEnum> sections;
  final double widthPercentage;

  UserResumeLayoutEntity({
    required this.id,
    required this.side,
    required this.sections,
    required this.widthPercentage,
  });
}