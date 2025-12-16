enum TypeLanguageEnum {
  VIETNAMESE,
  ENGLISH,
}

extension TypeLanguageEnumExtension on TypeLanguageEnum {

  static TypeLanguageEnum fromString(String value) {
    switch (value) {
      case 'VIETNAMESE':
        return TypeLanguageEnum.VIETNAMESE;
      case 'ENGLISH':
        return TypeLanguageEnum.ENGLISH;
      default:
        return TypeLanguageEnum.VIETNAMESE;
    }
  }
}