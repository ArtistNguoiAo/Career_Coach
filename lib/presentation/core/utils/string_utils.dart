import 'package:career_coach/domain/enum/type_resume_section_enum.dart';
import 'package:career_coach/presentation/core/extension/ext_context.dart';
import 'package:flutter/cupertino.dart';

class StringUtils {
  static String getInitialsName(String fullName) {
    final words = fullName.trim().split(RegExp(r'\s+'));
    if (words.isEmpty) return '';
    if (words.length == 1) return words.first[0].toUpperCase();

    final first = words.first[0].toUpperCase();
    final last = words.last[0].toUpperCase();
    return '$first$last';
  }

  static List<String> getListResumeSections(BuildContext context) {
    return TypeResumeSectionEnumExtension.list().map((e) {
      switch (e) {
        case TypeResumeSectionEnum.contactInformation:
          return context.language.contactInformation;
        case TypeResumeSectionEnum.avatar:
          return context.language.avatar;
        case TypeResumeSectionEnum.workExperience:
          return context.language.workExperience;
        case TypeResumeSectionEnum.project:
          return context.language.project;
        case TypeResumeSectionEnum.activity:
          return context.language.activity;
        case TypeResumeSectionEnum.award:
          return context.language.award;
        case TypeResumeSectionEnum.certificate:
          return context.language.certificate;
        case TypeResumeSectionEnum.education:
          return context.language.education;
        case TypeResumeSectionEnum.favorite:
          return context.language.favorite;
        case TypeResumeSectionEnum.goal:
          return context.language.goal;
        case TypeResumeSectionEnum.skill:
          return context.language.skill;
        case TypeResumeSectionEnum.otherInformation:
          return context.language.otherInformation;
      }
    }).toList();
  }
}