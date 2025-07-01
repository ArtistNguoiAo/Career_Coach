import 'package:career_coach/presentation/core/mode/language/data/base_language.dart';
import 'package:career_coach/presentation/core/mode/language/data/en_language.dart';
import 'package:career_coach/presentation/core/mode/language/inherited_language_widget.dart';
import 'package:career_coach/presentation/core/mode/theme/data/base_theme.dart';
import 'package:career_coach/presentation/core/mode/theme/data/light_theme.dart';
import 'package:career_coach/presentation/core/mode/theme/inherited_theme_widget.dart';
import 'package:flutter/material.dart';

extension ExtContext on BuildContext {

  BaseTheme get theme {
    return InheritedThemeWidget.of(this)?.getThemeData() ?? LightTheme();
  }

  BaseLanguage get language {
    return InheritedLanguageWidget.of(this)?.getLanguageData() ?? EnLanguage();
  }
}