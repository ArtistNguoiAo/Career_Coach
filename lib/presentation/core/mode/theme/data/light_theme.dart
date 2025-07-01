import 'dart:ui';

import 'package:career_coach/presentation/core/mode/theme/data/base_theme.dart';

class LightTheme extends BaseTheme {
  LightTheme._();

  static final LightTheme _instance = LightTheme._();

  factory LightTheme() => _instance;

  @override
  Color get primaryColor => const Color(0xFFFFFFFF);

  @override
  Color get borderColor => const Color(0xFF9E9E9E);
}