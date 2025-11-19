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

  @override
  String get workExperience => 'Kinh nghiệm làm việc';

  @override
  String get professionalPosition => 'Vị trí chuyên môn';

  @override
  String get notUpdate => 'Chưa cập nhật';

  @override
  String get edit => 'Sửa';

  @override
  String get loading => 'Đang tải';

  @override
  String get manageCv => 'Quản lý CV';

  @override
  String get manageCl => 'Quản lý CL';

  @override
  String get accountSettings => 'Cài đặt tài khoản';

  @override
  String get upgradeToPremium => 'Nâng cấp lên Premium';

  @override
  String get changePassword => 'Đổi mật khẩu';

  @override
  String get deleteAccount => 'Xóa tài khoản';

  @override
  String get logout => 'Đăng xuất';

  @override
  String get policyAndSupport => 'Chính sách & Hỗ trợ';

  @override
  String get appReview => 'Đánh giá ứng dụng';

  @override
  String get feedback => 'Phản hồi';

  @override
  String get checkForNewUpdate => 'Kiểm tra cập nhật mới';

  @override
  String get profileUpdate => 'Cập nhật hồ sơ';

  @override
  String get chooseImage => 'Chọn hình ảnh';

  @override
  String get fromGallery => 'Từ thư viện';

  @override
  String get fromCamera => 'Từ camera';

  @override
  String get save => 'Lưu';

  @override
  String get updateProfileSuccess => 'Cập nhật hồ sơ thành công';

  @override
  String get cancelChange => 'Hủy thay đổi';

  @override
  String get contentCancelChange => 'Các thay đổi của bạn có thể không được lưu. Bạn có chắc muốn huỷ bỏ tất cả các thay đổi không?';

  @override
  String get continueChange => 'Tiếp tục sửa';

  @override
  String get cancelChange2 => 'Hủy bỏ thay đổi';

  @override
  String get passwordNotMatch => 'Mật khẩu không khớp';

  @override
  String get registerSuccess => 'Đăng ký thành công';

  @override
  String get deleteAccountSuccess => 'Xóa tài khoản thành công';

  @override
  String get deleteAccountContent => 'Bạn có chắc chắn muốn xóa tài khoản của mình? Hành động này không thể hoàn tác.';

  @override
  String get cancel => 'Hủy';

  @override
  String get delete => 'Xóa';

  @override
  String get useThisTemplate => 'Sử dụng mẫu này';

  @override
  String get changeTemplate => 'Thay đổi mẫu';

  @override
  String get editTheme => 'Sửa giao diện';

  @override
  String get editContent => 'Sửa nội dung';

  @override
  String get activity => 'Hoạt động';

  @override
  String get avatar => 'Ảnh đại diện';

  @override
  String get award => 'Giải thưởng';

  @override
  String get certificate => 'Chứng chỉ';

  @override
  String get contactInformation => 'Thông tin liên hệ';

  @override
  String get education => 'Học vấn';

  @override
  String get favorite => 'Sở thích';

  @override
  String get goal => 'Mục tiêu';

  @override
  String get otherInformation => 'Thông tin khác';

  @override
  String get skill => 'Kỹ năng';

  @override
  String get project => 'Dự án';

  @override
  String get addSection => 'Thêm mục';

  @override
  String get position => 'Vị trí';

  @override
  String get address => 'Địa chỉ';

  @override
  String get personalWebsite => 'Website cá nhân';

  @override
  String get linkedIn => 'LinkedIn';

  @override
  String get github => 'GitHub';

  @override
  String get facebook => 'Facebook';

  @override
  String get portfolio => 'Portfolio';

  @override
  String get dateOfBirth => 'Ngày sinh';

  @override
  String get gender => 'Giới tính';

  @override
  String get male => 'Nam';

  @override
  String get female => 'Nữ';

  @override
  String get company => 'Công ty';

  @override
  String get startDate => 'Ngày bắt đầu';

  @override
  String get endDate => 'Ngày kết thúc';

  @override
  String get description => 'Mô tả';

  @override
  String get nameProject => 'Tên dự án';

  @override
  String get add => 'Thêm';

  @override
  String get organization => 'Tổ chức';

  @override
  String get nameAward => 'Tên giải thưởng';

  @override
  String get nameCertificate => 'Tên chứng chỉ';

  @override
  String get link => 'Liên kết';

  @override
  String get time => 'Thời gian';

  @override
  String get nameSchool => 'Tên trường';

  @override
  String get major => 'Chuyên ngành';

  @override
  String get degree => 'Bằng cấp';

  @override
  String get nameSkill => 'Tên kỹ năng';

  @override
  String get careerGoal => 'Mục tiêu nghề nghiệp';

  @override
  String get information => 'Thông tin';
}