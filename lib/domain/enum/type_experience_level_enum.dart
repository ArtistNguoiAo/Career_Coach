enum TypeCvExperienceLevelEnum {
  INTERN,
  FRESHER,
  JUNIOR,
  MIDDLE,
  SENIOR,
  LEAD
}

extension TypeCvExperienceLevelEnumExtension on TypeCvExperienceLevelEnum {
  static TypeCvExperienceLevelEnum fromString(String value) {
    switch (value) {
      case 'INTERN':
        return TypeCvExperienceLevelEnum.INTERN;
      case 'FRESHER':
        return TypeCvExperienceLevelEnum.FRESHER;
      case 'JUNIOR':
        return TypeCvExperienceLevelEnum.JUNIOR;
      case 'MIDDLE':
        return TypeCvExperienceLevelEnum.MIDDLE;
      case 'SENIOR':
        return TypeCvExperienceLevelEnum.SENIOR;
      case 'LEAD':
        return TypeCvExperienceLevelEnum.LEAD;
      default:
        return TypeCvExperienceLevelEnum.INTERN;
    }
  }
}