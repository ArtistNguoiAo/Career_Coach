enum TypeResumeEnum {
  basic,
  modern,
}

extension TypeResumeEnumExtension on TypeResumeEnum {
  String get name {
    switch (this) {
      case TypeResumeEnum.basic:
        return 'basic';
      case TypeResumeEnum.modern:
        return 'modern';
    }
  }

  static TypeResumeEnum fromString(String type) {
    switch (type) {
      case 'basic':
        return TypeResumeEnum.basic;
      case 'modern':
        return TypeResumeEnum.modern;
      default:
        throw ArgumentError('Unknown TypeResumeEnum: $type');
    }
  }
}