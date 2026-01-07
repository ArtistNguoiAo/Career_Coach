enum TypeAnalysisStatusEnum {
  PROCESSING,
  COMPLETED,
}

extension TypeAnalysisStatusEnumExtension on TypeAnalysisStatusEnum {
  static TypeAnalysisStatusEnum fromString(String value) {
    switch (value) {
      case 'PROCESSING':
        return TypeAnalysisStatusEnum.PROCESSING;
      case 'COMPLETED':
        return TypeAnalysisStatusEnum.COMPLETED;
      default:
        return TypeAnalysisStatusEnum.PROCESSING;
    }
  }
}