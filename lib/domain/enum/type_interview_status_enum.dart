enum TypeInterviewStatusEnum {
  ACTIVE,
  COMPLETED
}

extension TypeInterviewStatusEnumExtension on TypeInterviewStatusEnum {


  static TypeInterviewStatusEnum fromString(String value) {
    switch (value) {
      case 'ACTIVE':
        return TypeInterviewStatusEnum.ACTIVE;
      case 'COMPLETED':
        return TypeInterviewStatusEnum.COMPLETED;
      default:
        return TypeInterviewStatusEnum.ACTIVE;
    }
  }
}