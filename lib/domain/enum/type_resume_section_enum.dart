enum TypeResumeSectionEnum {
  contactInformation,
  avatar,
  workExperience,
  project,
  activity,
  award,
  certificate,
  education,
  favorite,
  goal,
  skill,
  otherInformation,
}

extension TypeResumeSectionEnumExtension on TypeResumeSectionEnum {
  static List<TypeResumeSectionEnum> list() {
    return TypeResumeSectionEnum.values;
  }
}