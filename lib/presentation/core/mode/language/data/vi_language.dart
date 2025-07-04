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

  @override
  String get haveAGoodDay => 'Chúc bạn một ngày tốt lành';

  @override
  String get welcomeApp => 'Welcome to Career Coach!';

  @override
  String get introduce => "Tạo CV chuyên nghiệp trong vài phút. Gây ấn tượng mạnh với nhà tuyển dụng!";

  @override
  String get hello => 'Xin chào';

  @override
  String get cvAndCl => 'CV và Thư xin việc';

  @override
  String get cv => 'CV';

  @override
  String get cl => 'Thư xin việc';

  @override
  String get outstanding => 'Nổi bật';

  @override
  String get tool => 'Công cụ';

  @override
  String get calculateGrossNetSalary => 'Tính lương Gross - Net';

  @override
  String get search => 'Tìm kiếm';

  @override
  String get good => 'Tốt';

  @override
  String get medium => 'Trung bình';

  @override
  String get bad => 'Kém';

  @override
  String get home => 'Trang chủ';

  @override
  String get cvAndCl_2 => 'CV & CL';

  @override
  String get chatBot => 'Trợ lý ảo';

  @override
  String get profile => 'Hồ sơ';
}