enum TypeResumeEnum {
  basic,
  modern,
  creative,
  professional,
  technical,
}

extension TypeResumeEnumExtension on TypeResumeEnum {
  String get name {
    switch (this) {
      case TypeResumeEnum.basic:
        return 'basic';
      case TypeResumeEnum.modern:
        return 'modern';
      case TypeResumeEnum.creative:
        return 'creative';
      case TypeResumeEnum.professional:
        return 'professional';
      case TypeResumeEnum.technical:
        return 'technical';
    }
  }

  static TypeResumeEnum fromString(String type) {
    switch (type) {
      case 'basic':
        return TypeResumeEnum.basic;
      case 'modern':
        return TypeResumeEnum.modern;
      case 'creative':
        return TypeResumeEnum.creative;
      case 'professional':
        return TypeResumeEnum.professional;
      case 'technical':
        return TypeResumeEnum.technical;
      default:
        throw ArgumentError('Unknown TypeResumeEnum: $type');
    }
  }
}