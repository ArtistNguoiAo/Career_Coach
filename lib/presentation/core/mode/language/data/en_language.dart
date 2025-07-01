import 'package:career_coach/presentation/core/mode/language/data/base_language.dart';

class EnLanguage extends BaseLanguage {
  EnLanguage._();

  static final EnLanguage _instance = EnLanguage._();

  factory EnLanguage() => _instance;

  @override
  String get appName => 'Career Coach';
}