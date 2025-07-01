import 'package:career_coach/presentation/core/mode/language/data/base_language.dart';
import 'package:career_coach/presentation/core/mode/language/data/en_language.dart';
import 'package:career_coach/presentation/core/mode/language/data/vi_language.dart';
import 'package:flutter/material.dart';

enum LanguageModeEnum { en, vi }

class InheritedLanguageWidget extends InheritedWidget {
  final LanguageModeEnum? languageModeEnum;

  const InheritedLanguageWidget({
    required super.child,
    this.languageModeEnum,
    super.key,
  });

  @override
  bool updateShouldNotify(InheritedLanguageWidget oldWidget) {
    return languageModeEnum != oldWidget.languageModeEnum;
  }

  static InheritedLanguageWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedLanguageWidget>();
  }

  BaseLanguage getLanguageData() {
    switch (languageModeEnum) {
      case LanguageModeEnum.en:
        return EnLanguage();
      case LanguageModeEnum.vi:
        return ViLanguage();
      default:
        return EnLanguage();
    }
  }
}