enum TypeResumeSectionEnum {
  CONTACT_INFORMATION,
  AVATAR,
  WORK_EXPERIENCE,
  PROJECT,
  ACTIVITY,
  AWARD,
  CERTIFICATE,
  EDUCATION,
  FAVORITE,
  GOAL,
  SKILL,
  OTHER_INFORMATION,
}

extension TypeResumeSectionEnumExtension on TypeResumeSectionEnum {
  static List<TypeResumeSectionEnum> list() {
    return TypeResumeSectionEnum.values;
  }

  static TypeResumeSectionEnum fromString(String section) {
    switch (section) {
      case 'CONTACT_INFORMATION':
        return TypeResumeSectionEnum.CONTACT_INFORMATION;
      case 'AVATAR':
        return TypeResumeSectionEnum.AVATAR;
      case 'WORK_EXPERIENCE':
        return TypeResumeSectionEnum.WORK_EXPERIENCE;
      case 'PROJECT':
        return TypeResumeSectionEnum.PROJECT;
      case 'ACTIVITY':
        return TypeResumeSectionEnum.ACTIVITY;
      case 'AWARD':
        return TypeResumeSectionEnum.AWARD;
      case 'CERTIFICATE':
        return TypeResumeSectionEnum.CERTIFICATE;
      case 'EDUCATION':
        return TypeResumeSectionEnum.EDUCATION;
      case 'FAVORITE':
        return TypeResumeSectionEnum.FAVORITE;
      case 'GOAL':
        return TypeResumeSectionEnum.GOAL;
      case 'SKILL':
        return TypeResumeSectionEnum.SKILL;
      case 'OTHER_INFORMATION':
        return TypeResumeSectionEnum.OTHER_INFORMATION;
      default:
        return TypeResumeSectionEnum.CONTACT_INFORMATION;
    }
  }
}