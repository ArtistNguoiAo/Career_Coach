import 'package:career_coach/data/service/device_info_service.dart';
import 'package:career_coach/data/service/google_sign_in_service.dart';
import 'package:career_coach/domain/entity/auth_entity.dart';
import 'package:career_coach/domain/repository/auth_repository.dart';

class GoogleLoginUseCase {
  final AuthRepository _authRepository;

  GoogleLoginUseCase(this._authRepository);

  Future<AuthEntity> call() async {
    // Get Google ID Token
    final String? idToken = await GoogleSignInService.signInWithGoogle();
    if (idToken == null) {
      throw Exception('Google Sign In was cancelled or failed');
    }

    // Get device info
    final String deviceInfo = await DeviceInfoService.getDeviceInfo();

    // Call API
    return await _authRepository.loginWithProvider(
      externalToken: idToken,
      provider: 'google',
      deviceInfo: deviceInfo,
    );
  }
}
