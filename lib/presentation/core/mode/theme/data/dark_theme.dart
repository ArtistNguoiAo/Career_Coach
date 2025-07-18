import 'dart:ui';

import 'package:career_coach/presentation/core/mode/theme/data/base_theme.dart';

class DarkTheme extends BaseTheme {
  DarkTheme._();

  static final DarkTheme _instance = DarkTheme._();

  factory DarkTheme() => _instance;

  @override
  Color get primaryColor => const Color(0xFF00CA87);

  @override
  Color get borderColor => const Color(0xFF9E9E9E);

  @override
  Color get backgroundColor => const Color(0xFFFFFFFF);

  @override
  Color get textColor => const Color(0xFF000000);

  @override
  Color get goodColor => const Color(0xFF38B61B);

  @override
  Color get mediumColor => const Color(0xFFFF8C00);

  @override
  Color get badColor => const Color(0xFFFF0000);
}