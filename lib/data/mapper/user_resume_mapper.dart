import 'package:career_coach/data/mapper/user_resume_layout_mapper.dart';
import 'package:career_coach/data/model/user_resume_model.dart';
import 'package:career_coach/domain/entity/user_resume_entity.dart';
import 'package:career_coach/domain/enum/type_font_family_enum.dart';
import 'package:career_coach/domain/enum/type_language_enum.dart';

class UserResumeMapper {
  static UserResumeEntity toEntity(UserResumeModel userResumeModel) {
    return UserResumeEntity(
      id: userResumeModel.id,
      title: userResumeModel.title,
      numberOfColumns: userResumeModel.numberOfColumns,
      language: TypeLanguageEnumExtension.fromString(userResumeModel.language),
      fontFamily: TypeFontFamilyEnumExtension.fromString(userResumeModel.fontFamily),
      fontSize: userResumeModel.fontSize,
      lineHeight: userResumeModel.lineHeight,
      color: userResumeModel.color,
      layouts: userResumeModel.layouts.map((layout) => UserResumeLayoutMapper.toEntity(layout)).toList(),
    );
  }
}