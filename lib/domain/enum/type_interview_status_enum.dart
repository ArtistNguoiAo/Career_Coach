enum TypeInterviewStatusEnum {
  ACTIVE,
  COMPLETED,
  CANCELLED
}

extension TypeInterviewStatusEnumExtension on TypeInterviewStatusEnum {
  static TypeInterviewStatusEnum fromString(String value) {
    switch (value) {
      case 'ACTIVE':
        return TypeInterviewStatusEnum.ACTIVE;
      case 'COMPLETED':
        return TypeInterviewStatusEnum.COMPLETED;
      case 'CANCELLED':
        return TypeInterviewStatusEnum.CANCELLED;
      default:
        return TypeInterviewStatusEnum.ACTIVE;
    }
  }
}