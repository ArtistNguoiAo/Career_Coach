enum TypeSideEnum {
  NONE,
  LEFT,
  RIGHT,
}

extension TypeSideEnumExtension on TypeSideEnum {

  static TypeSideEnum fromString(String value) {
    switch (value) {
      case 'NONE':
        return TypeSideEnum.NONE;
      case 'LEFT':
        return TypeSideEnum.LEFT;
      case 'RIGHT':
        return TypeSideEnum.RIGHT;
      default:
        return TypeSideEnum.NONE;
    }
  }

}