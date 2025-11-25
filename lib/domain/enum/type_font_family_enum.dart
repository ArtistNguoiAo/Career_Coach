enum TypeFontFamilyEnum {
  ARIAL,
  TIMES_NEW_ROMAN,
  COURIER_NEW,
  ROBOTO,
  OPEN_SANS,
}

extension TypeFontFamilyEnumExtension on TypeFontFamilyEnum {
  static TypeFontFamilyEnum fromString(String value) {
    switch (value) {
      case 'ARIAL':
        return TypeFontFamilyEnum.ARIAL;
      case 'TIMES_NEW_ROMAN':
        return TypeFontFamilyEnum.TIMES_NEW_ROMAN;
      case 'COURIER_NEW':
        return TypeFontFamilyEnum.COURIER_NEW;
      case 'ROBOTO':
        return TypeFontFamilyEnum.ROBOTO;
      case 'OPEN_SANS':
        return TypeFontFamilyEnum.OPEN_SANS;
      default:
        return TypeFontFamilyEnum.ARIAL;
    }
  }
}