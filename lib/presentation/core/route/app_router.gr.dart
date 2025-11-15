// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:career_coach/domain/entity/resume_entity.dart' as _i13;
import 'package:career_coach/domain/entity/user_entity.dart' as _i14;
import 'package:career_coach/presentation/screen/auth/login/login_screen.dart'
    as _i4;
import 'package:career_coach/presentation/screen/auth/register/register_screen.dart'
    as _i9;
import 'package:career_coach/presentation/screen/over_view/home/home_screen.dart'
    as _i1;
import 'package:career_coach/presentation/screen/over_view/list_cv_and_cl/list_cv_and_cl_screen.dart'
    as _i2;
import 'package:career_coach/presentation/screen/over_view/list_interview/list_interview_screen.dart'
    as _i3;
import 'package:career_coach/presentation/screen/over_view/over_view_screen.dart'
    as _i5;
import 'package:career_coach/presentation/screen/over_view/preview_resume/preview_resume_screen.dart'
    as _i6;
import 'package:career_coach/presentation/screen/over_view/profile/profile_screen.dart'
    as _i7;
import 'package:career_coach/presentation/screen/profile_update/profile_update_screen.dart'
    as _i8;
import 'package:career_coach/presentation/screen/splash/splash_screen.dart'
    as _i10;
import 'package:flutter/material.dart' as _i12;

/// generated route for
/// [_i1.HomeScreen]
class HomeRoute extends _i11.PageRouteInfo<void> {
  const HomeRoute({List<_i11.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i1.HomeScreen();
    },
  );
}

/// generated route for
/// [_i2.ListCvAndClScreen]
class ListCvAndClRoute extends _i11.PageRouteInfo<void> {
  const ListCvAndClRoute({List<_i11.PageRouteInfo>? children})
    : super(ListCvAndClRoute.name, initialChildren: children);

  static const String name = 'ListCvAndClRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i2.ListCvAndClScreen();
    },
  );
}

/// generated route for
/// [_i3.ListInterviewScreen]
class ListInterviewRoute extends _i11.PageRouteInfo<ListInterviewRouteArgs> {
  ListInterviewRoute({_i12.Key? key, List<_i11.PageRouteInfo>? children})
    : super(
        ListInterviewRoute.name,
        args: ListInterviewRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'ListInterviewRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ListInterviewRouteArgs>(
        orElse: () => const ListInterviewRouteArgs(),
      );
      return _i3.ListInterviewScreen(key: args.key);
    },
  );
}

class ListInterviewRouteArgs {
  const ListInterviewRouteArgs({this.key});

  final _i12.Key? key;

  @override
  String toString() {
    return 'ListInterviewRouteArgs{key: $key}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ListInterviewRouteArgs) return false;
    return key == other.key;
  }

  @override
  int get hashCode => key.hashCode;
}

/// generated route for
/// [_i4.LoginScreen]
class LoginRoute extends _i11.PageRouteInfo<void> {
  const LoginRoute({List<_i11.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i4.LoginScreen();
    },
  );
}

/// generated route for
/// [_i5.OverViewScreen]
class OverViewRoute extends _i11.PageRouteInfo<void> {
  const OverViewRoute({List<_i11.PageRouteInfo>? children})
    : super(OverViewRoute.name, initialChildren: children);

  static const String name = 'OverViewRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i5.OverViewScreen();
    },
  );
}

/// generated route for
/// [_i6.PreviewResumeScreen]
class PreviewResumeRoute extends _i11.PageRouteInfo<PreviewResumeRouteArgs> {
  PreviewResumeRoute({
    _i12.Key? key,
    required _i13.ResumeEntity resumeEntity,
    List<_i11.PageRouteInfo>? children,
  }) : super(
         PreviewResumeRoute.name,
         args: PreviewResumeRouteArgs(key: key, resumeEntity: resumeEntity),
         initialChildren: children,
       );

  static const String name = 'PreviewResumeRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PreviewResumeRouteArgs>();
      return _i6.PreviewResumeScreen(
        key: args.key,
        resumeEntity: args.resumeEntity,
      );
    },
  );
}

class PreviewResumeRouteArgs {
  const PreviewResumeRouteArgs({this.key, required this.resumeEntity});

  final _i12.Key? key;

  final _i13.ResumeEntity resumeEntity;

  @override
  String toString() {
    return 'PreviewResumeRouteArgs{key: $key, resumeEntity: $resumeEntity}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PreviewResumeRouteArgs) return false;
    return key == other.key && resumeEntity == other.resumeEntity;
  }

  @override
  int get hashCode => key.hashCode ^ resumeEntity.hashCode;
}

/// generated route for
/// [_i7.ProfileScreen]
class ProfileRoute extends _i11.PageRouteInfo<void> {
  const ProfileRoute({List<_i11.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i7.ProfileScreen();
    },
  );
}

/// generated route for
/// [_i8.ProfileUpdateScreen]
class ProfileUpdateRoute extends _i11.PageRouteInfo<ProfileUpdateRouteArgs> {
  ProfileUpdateRoute({
    _i12.Key? key,
    required _i14.UserEntity userEntity,
    List<_i11.PageRouteInfo>? children,
  }) : super(
         ProfileUpdateRoute.name,
         args: ProfileUpdateRouteArgs(key: key, userEntity: userEntity),
         initialChildren: children,
       );

  static const String name = 'ProfileUpdateRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProfileUpdateRouteArgs>();
      return _i8.ProfileUpdateScreen(
        key: args.key,
        userEntity: args.userEntity,
      );
    },
  );
}

class ProfileUpdateRouteArgs {
  const ProfileUpdateRouteArgs({this.key, required this.userEntity});

  final _i12.Key? key;

  final _i14.UserEntity userEntity;

  @override
  String toString() {
    return 'ProfileUpdateRouteArgs{key: $key, userEntity: $userEntity}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ProfileUpdateRouteArgs) return false;
    return key == other.key && userEntity == other.userEntity;
  }

  @override
  int get hashCode => key.hashCode ^ userEntity.hashCode;
}

/// generated route for
/// [_i9.RegisterScreen]
class RegisterRoute extends _i11.PageRouteInfo<void> {
  const RegisterRoute({List<_i11.PageRouteInfo>? children})
    : super(RegisterRoute.name, initialChildren: children);

  static const String name = 'RegisterRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i9.RegisterScreen();
    },
  );
}

/// generated route for
/// [_i10.SplashScreen]
class SplashRoute extends _i11.PageRouteInfo<void> {
  const SplashRoute({List<_i11.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i11.PageInfo page = _i11.PageInfo(
    name,
    builder: (data) {
      return const _i10.SplashScreen();
    },
  );
}
