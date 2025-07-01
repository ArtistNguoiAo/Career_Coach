import 'package:career_coach/presentation/core/mode/language/data/base_language.dart';

class EnLanguage extends BaseLanguage {
  EnLanguage._();

  static final EnLanguage _instance = EnLanguage._();

  factory EnLanguage() => _instance;

  @override
  String get appName => 'Career Coach';

  @override
  String get login => 'Login';

  @override
  String get register => 'Register';

  @override
  String get email => 'Email';

  @override
  String get password => 'Password';

  @override
  String get phone => 'Phone';

  @override
  String get confirmPassword => 'Confirm password';

  @override
  String get fullName => 'Full name';

  @override
  String get rememberMe => 'Remember me';

  @override
  String get version => 'Version';

  @override
  String get haveAccount => 'Have an account?';

  @override
  String get forgotPassword => 'Forgot password?';

  @override
  String get back => 'Back';
}