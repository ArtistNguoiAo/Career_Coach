enum TypeResumeEnum {
  BASIC,
  MODERN,
  CREATIVE,
  PROFESSIONAL,
  TECHNICAL,
}

extension TypeResumeEnumExtension on TypeResumeEnum {

  static TypeResumeEnum fromString(String type) {
    switch (type) {
      case 'BASIC':
        return TypeResumeEnum.BASIC;
      case 'MODERN':
        return TypeResumeEnum.MODERN;
      case 'CREATIVE':
        return TypeResumeEnum.CREATIVE;
      case 'PROFESSIONAL':
        return TypeResumeEnum.PROFESSIONAL;
      case 'TECHNICAL':
        return TypeResumeEnum.TECHNICAL;
      default:
        return TypeResumeEnum.BASIC;
    }
  }
}