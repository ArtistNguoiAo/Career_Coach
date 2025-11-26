import 'package:career_coach/domain/enum/type_resume_section_enum.dart';
import 'package:career_coach/presentation/core/extension/ext_context.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class StringUtils {
  static String getInitialsName(String fullName) {
    final words = fullName.trim().split(RegExp(r'\s+'));
    if (words.isEmpty) return '';
    if (words.length == 1) return words.first[0].toUpperCase();

    final first = words.first[0].toUpperCase();
    final last = words.last[0].toUpperCase();
    return '$first$last';
  }

  static String convertDateString(String input) {
    DateTime date = DateTime.parse(input);
    return DateFormat('HH:mm:ss dd/MM/yyyy').format(date);
  }

  static String convertTypeResumeSectionEnum(BuildContext context, TypeResumeSectionEnum type) {
    switch (type) {
      case TypeResumeSectionEnum.CONTACT_INFORMATION:
        return context.language.contactInformation;
      case TypeResumeSectionEnum.AVATAR:
        return context.language.avatar;
      case TypeResumeSectionEnum.WORK_EXPERIENCE:
        return context.language.workExperience;
      case TypeResumeSectionEnum.PROJECT:
        return context.language.project;
      case TypeResumeSectionEnum.ACTIVITY:
        return context.language.activity;
      case TypeResumeSectionEnum.AWARD:
        return context.language.award;
      case TypeResumeSectionEnum.CERTIFICATE:
        return context.language.certificate;
      case TypeResumeSectionEnum.EDUCATION:
        return context.language.education;
      case TypeResumeSectionEnum.FAVORITE:
        return context.language.favorite;
      case TypeResumeSectionEnum.GOAL:
        return context.language.goal;
      case TypeResumeSectionEnum.SKILL:
        return context.language.skill;
      case TypeResumeSectionEnum.OTHER_INFORMATION:
        return context.language.otherInformation;
      }
  }
}