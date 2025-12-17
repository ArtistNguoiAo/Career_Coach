enum TypeMessageRoleEnum {
  SYSTEM,
  USER,
  ASSISTANT
}

extension TypeMessageRoleEnumExtension on TypeMessageRoleEnum {
  static TypeMessageRoleEnum fromString(String value) {
    switch (value) {
      case 'SYSTEM':
        return TypeMessageRoleEnum.SYSTEM;
      case 'USER':
        return TypeMessageRoleEnum.USER;
      case 'ASSISTANT':
        return TypeMessageRoleEnum.ASSISTANT;
      default:
        return TypeMessageRoleEnum.USER;
    }
  }
}