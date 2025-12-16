import 'package:career_coach/domain/enum/type_resume_section_enum.dart';
import 'package:career_coach/domain/enum/type_side_enum.dart';

class UserResumeLayoutEntity {
  final int id;
  TypeSideEnum side;
  List<TypeResumeSectionEnum> sections;
  double widthPercentage;

  UserResumeLayoutEntity({
    required this.id,
    required this.side,
    required this.sections,
    required this.widthPercentage,
  });

  UserResumeLayoutEntity copyWith({
    int? id,
    TypeSideEnum? side,
    List<TypeResumeSectionEnum>? sections,
    double? widthPercentage,
  }) {
    return UserResumeLayoutEntity(
      id: id ?? this.id,
      side: side ?? this.side,
      sections: sections ?? this.sections,
      widthPercentage: widthPercentage ?? this.widthPercentage,
    );
  }
}