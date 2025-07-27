import 'package:flutter/material.dart';
import 'package:career_coach/data/service/device_info_service.dart';
import 'package:career_coach/data/service/github_oauth_service.dart';
import 'package:career_coach/domain/entity/auth_entity.dart';
import 'package:career_coach/domain/repository/auth_repository.dart';

class GitHubLoginUseCase {
  final AuthRepository _authRepository;

  GitHubLoginUseCase(this._authRepository);

  Future<AuthEntity> call(BuildContext context) async {
    // Get GitHub ID Token (access token)
    final String? idToken = await GitHubOAuthService.getIdToken(context);
    if (idToken == null) {
      throw Exception('GitHub Sign In was cancelled or failed');
    }

    // Get device info
    final String deviceInfo = await DeviceInfoService.getDeviceInfo();

    // Call API
    return await _authRepository.loginWithProvider(
      externalToken: idToken,
      provider: 'github',
      deviceInfo: deviceInfo,
    );
  }
}
