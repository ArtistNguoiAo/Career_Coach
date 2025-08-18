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

  @override
  String get workExperience => 'Work experience';

  @override
  String get professionalPosition => 'Professional position';

  @override
  String get notUpdate => 'Not updated';

  @override
  String get edit => 'Edit';

  @override
  String get loading => 'Loading';

  @override
  String get manageCv => 'Manage CV';

  @override
  String get manageCl => 'Manage CL';

  @override
  String get accountSettings => 'Account Settings';

  @override
  String get upgradeToPremium => 'Upgrade to Premium';

  @override
  String get changePassword => 'Change Password';

  @override
  String get deleteAccount => 'Delete Account';

  @override
  String get logout => 'Logout';

  @override
  String get policyAndSupport => 'Policy & Support';

  @override
  String get appReview => 'App Review';

  @override
  String get feedback => 'Feedback';

  @override
  String get checkForNewUpdate => 'Check for new update';

  @override
  String get profileUpdate => 'Update Profile';

  @override
  String get chooseImage => 'Choose Image';

  @override
  String get fromGallery => 'From Gallery';

  @override
  String get fromCamera => 'From Camera';

  @override
  String get save => 'Save';

  @override
  String get updateProfileSuccess => 'Profile updated successfully';

  @override
  String get cancelChange => 'Cancel Change';

  @override
  String get contentCancelChange => 'Your changes may not be saved. Are you sure you want to discard all changes?';

  @override
  String get continueChange => 'Continue Change';

  @override
  String get cancelChange2 => 'Cancel Change';

  @override
  String get passwordNotMatch => 'Password does not match';

  @override
  String get registerSuccess => 'Register success';

  @override
  String get deleteAccountSuccess => 'Delete account success';

  @override
  String get deleteAccountContent => 'Are you sure you want to delete your account? This action cannot be undone.';

  @override
  String get cancel => 'Cancel';

  @override
  String get delete => 'Delete';
}