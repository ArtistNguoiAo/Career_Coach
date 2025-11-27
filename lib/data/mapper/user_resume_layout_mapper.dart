import 'package:career_coach/data/model/user_resume_layout_model.dart';
import 'package:career_coach/domain/entity/user_resume_layout_entity.dart';
import 'package:career_coach/domain/enum/type_resume_section_enum.dart';
import 'package:career_coach/domain/enum/type_side_enum.dart';

class UserResumeLayoutMapper {
  static UserResumeLayoutEntity toEntity(UserResumeLayoutModel userResumeLayoutModel) {
    return UserResumeLayoutEntity(
      id: userResumeLayoutModel.id,
      side: TypeSideEnumExtension.fromString(userResumeLayoutModel.side),
      sections: userResumeLayoutModel.sections
          .map((section) => TypeResumeSectionEnumExtension.fromString(section))
          .toList(),
      widthPercentage: userResumeLayoutModel.widthPercentage,
    );
  }
}