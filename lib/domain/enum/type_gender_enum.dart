enum TypeGenderEnum {
  MALE,
  FEMALE,
  OTHER,
}

extension TypeGenderEnumExtension on TypeGenderEnum {

  static TypeGenderEnum fromString(String value) {
    switch (value) {
      case 'MALE':
        return TypeGenderEnum.MALE;
      case 'FEMALE':
        return TypeGenderEnum.FEMALE;
      case 'OTHER':
        return TypeGenderEnum.OTHER;
      default:
        return TypeGenderEnum.OTHER;
    }
  }
}