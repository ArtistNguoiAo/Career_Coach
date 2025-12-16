enum TypeCvSourceEnum {
  USER_RESUME,
  PDF_UPLOAD,
}

extension TypeCvSourceEnumExtension on TypeCvSourceEnum {
  static TypeCvSourceEnum fromString(String value) {
    switch (value) {
      case 'USER_RESUME':
        return TypeCvSourceEnum.USER_RESUME;
      case 'PDF_UPLOAD':
        return TypeCvSourceEnum.PDF_UPLOAD;
      default:
        return TypeCvSourceEnum.USER_RESUME;
    }
  }
}