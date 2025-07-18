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

  @override
  String get haveAGoodDay => 'Have a good day';

  @override
  String get welcomeApp => 'Welcome to Career Coach!';

  @override
  String get introduce => "Create a professional CV in minutes. Make a strong impression on employers!";

  @override
  String get hello => 'Hello';

  @override
  String get cvAndCl => 'CV and Cover Letter';

  @override
  String get cv => 'CV';

  @override
  String get cl => 'Cover Letter';

  @override
  String get outstanding => 'Outstanding';

  @override
  String get tool => 'Tool';

  @override
  String get calculateGrossNetSalary => 'Calculate Gross/Net Salary';

  @override
  String get search => 'Search';

  @override
  String get good => 'Good';

  @override
  String get medium => 'Medium';

  @override
  String get bad => 'Bad';

  @override
  String get home => 'Home';

  @override
  String get cvAndCl_2 => 'CV & CL';

  @override
  String get chatBot => 'Chat Bot';

  @override
  String get profile => 'Profile';
}