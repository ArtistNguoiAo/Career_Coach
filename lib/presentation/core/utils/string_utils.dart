import 'package:career_coach/domain/enum/type_font_family_enum.dart';
import 'package:career_coach/domain/enum/type_gender_enum.dart';
import 'package:career_coach/domain/enum/type_language_enum.dart';
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
    return DateFormat('HH:mm:ss yyyy-MM-dd').format(date);
  }

  static String convertTypeGenderEnum(BuildContext context, TypeGenderEnum type) {
    switch (type) {
      case TypeGenderEnum.MALE:
        return context.language.male;
      case TypeGenderEnum.FEMALE:
        return context.language.female;
      case TypeGenderEnum.OTHER:
        return context.language.other;
    }
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

  static String convertTypeLanguageEnum(BuildContext context, TypeLanguageEnum type) {
    switch (type) {
      case TypeLanguageEnum.VIETNAMESE:
        return "Tiếng Việt";
      case TypeLanguageEnum.ENGLISH:
        return "English";
    }
  }

  static String convertTypeFontFamilyEnum(BuildContext context, TypeFontFamilyEnum type) {
    switch (type) {
      case TypeFontFamilyEnum.ARIAL:
        return "Arial";
      case TypeFontFamilyEnum.TIMES_NEW_ROMAN:
        return "Times New Roman";
      case TypeFontFamilyEnum.COURIER_NEW:
        return "Courier New";
      case TypeFontFamilyEnum.ROBOTO:
        return "Roboto";
      case TypeFontFamilyEnum.OPEN_SANS:
        return "Open Sans";
    }
  }
}