import 'package:career_coach/presentation/core/mode/language/data/base_language.dart';

class ViLanguage extends BaseLanguage {
  ViLanguage._();

  static final ViLanguage _instance = ViLanguage._();

  factory ViLanguage() => _instance;

  @override
  String get appName => 'Career Coach';

  @override
  String get login => 'Đăng nhập';

  @override
  String get register => 'Đăng ký';

  @override
  String get email => 'Email';

  @override
  String get password => 'Mật khẩu';

  @override
  String get phone => 'Số ĐT';

  @override
  String get confirmPassword => 'Xác nhận mật khẩu';

  @override
  String get fullName => 'Họ và tên';

  @override
  String get rememberMe => 'Nhớ tài khoản';

  @override
  String get version => 'Phiên bản';

  @override
  String get haveAccount => 'Đã có tài khoản?';

  @override
  String get forgotPassword => 'Quên mật khẩu?';

  @override
  String get back => 'Quay lại';
}