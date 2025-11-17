// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i13;
import 'package:career_coach/domain/entity/resume_entity.dart' as _i15;
import 'package:career_coach/domain/entity/user_entity.dart' as _i16;
import 'package:career_coach/presentation/screen/auth/login/login_screen.dart'
    as _i5;
import 'package:career_coach/presentation/screen/auth/register/register_screen.dart'
    as _i10;
import 'package:career_coach/presentation/screen/over_view/home/home_screen.dart'
    as _i2;
import 'package:career_coach/presentation/screen/over_view/list_cv_and_cl/list_cv_and_cl_screen.dart'
    as _i3;
import 'package:career_coach/presentation/screen/over_view/list_interview/list_interview_screen.dart'
    as _i4;
import 'package:career_coach/presentation/screen/over_view/over_view_screen.dart'
    as _i6;
import 'package:career_coach/presentation/screen/over_view/preview_resume/preview_resume_screen.dart'
    as _i7;
import 'package:career_coach/presentation/screen/over_view/profile/profile_screen.dart'
    as _i8;
import 'package:career_coach/presentation/screen/over_view/section_resume/contact_information/contact_information_screen.dart'
    as _i1;
import 'package:career_coach/presentation/screen/over_view/structure_resume/structure_resume_screen.dart'
    as _i12;
import 'package:career_coach/presentation/screen/profile_update/profile_update_screen.dart'
    as _i9;
import 'package:career_coach/presentation/screen/splash/splash_screen.dart'
    as _i11;
import 'package:flutter/material.dart' as _i14;

/// generated route for
/// [_i1.ContactInformationScreen]
class ContactInformationRoute extends _i13.PageRouteInfo<void> {
  const ContactInformationRoute({List<_i13.PageRouteInfo>? children})
    : super(ContactInformationRoute.name, initialChildren: children);

  static const String name = 'ContactInformationRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i1.ContactInformationScreen();
    },
  );
}

/// generated route for
/// [_i2.HomeScreen]
class HomeRoute extends _i13.PageRouteInfo<void> {
  const HomeRoute({List<_i13.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i2.HomeScreen();
    },
  );
}

/// generated route for
/// [_i3.ListCvAndClScreen]
class ListCvAndClRoute extends _i13.PageRouteInfo<void> {
  const ListCvAndClRoute({List<_i13.PageRouteInfo>? children})
    : super(ListCvAndClRoute.name, initialChildren: children);

  static const String name = 'ListCvAndClRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i3.ListCvAndClScreen();
    },
  );
}

/// generated route for
/// [_i4.ListInterviewScreen]
class ListInterviewRoute extends _i13.PageRouteInfo<ListInterviewRouteArgs> {
  ListInterviewRoute({_i14.Key? key, List<_i13.PageRouteInfo>? children})
    : super(
        ListInterviewRoute.name,
        args: ListInterviewRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'ListInterviewRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ListInterviewRouteArgs>(
        orElse: () => const ListInterviewRouteArgs(),
      );
      return _i4.ListInterviewScreen(key: args.key);
    },
  );
}

class ListInterviewRouteArgs {
  const ListInterviewRouteArgs({this.key});

  final _i14.Key? key;

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
/// [_i5.LoginScreen]
class LoginRoute extends _i13.PageRouteInfo<void> {
  const LoginRoute({List<_i13.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i5.LoginScreen();
    },
  );
}

/// generated route for
/// [_i6.OverViewScreen]
class OverViewRoute extends _i13.PageRouteInfo<void> {
  const OverViewRoute({List<_i13.PageRouteInfo>? children})
    : super(OverViewRoute.name, initialChildren: children);

  static const String name = 'OverViewRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i6.OverViewScreen();
    },
  );
}

/// generated route for
/// [_i7.PreviewResumeScreen]
class PreviewResumeRoute extends _i13.PageRouteInfo<PreviewResumeRouteArgs> {
  PreviewResumeRoute({
    _i14.Key? key,
    required _i15.ResumeEntity resumeEntity,
    List<_i13.PageRouteInfo>? children,
  }) : super(
         PreviewResumeRoute.name,
         args: PreviewResumeRouteArgs(key: key, resumeEntity: resumeEntity),
         initialChildren: children,
       );

  static const String name = 'PreviewResumeRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PreviewResumeRouteArgs>();
      return _i7.PreviewResumeScreen(
        key: args.key,
        resumeEntity: args.resumeEntity,
      );
    },
  );
}

class PreviewResumeRouteArgs {
  const PreviewResumeRouteArgs({this.key, required this.resumeEntity});

  final _i14.Key? key;

  final _i15.ResumeEntity resumeEntity;

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
/// [_i8.ProfileScreen]
class ProfileRoute extends _i13.PageRouteInfo<void> {
  const ProfileRoute({List<_i13.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i8.ProfileScreen();
    },
  );
}

/// generated route for
/// [_i9.ProfileUpdateScreen]
class ProfileUpdateRoute extends _i13.PageRouteInfo<ProfileUpdateRouteArgs> {
  ProfileUpdateRoute({
    _i14.Key? key,
    required _i16.UserEntity userEntity,
    List<_i13.PageRouteInfo>? children,
  }) : super(
         ProfileUpdateRoute.name,
         args: ProfileUpdateRouteArgs(key: key, userEntity: userEntity),
         initialChildren: children,
       );

  static const String name = 'ProfileUpdateRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProfileUpdateRouteArgs>();
      return _i9.ProfileUpdateScreen(
        key: args.key,
        userEntity: args.userEntity,
      );
    },
  );
}

class ProfileUpdateRouteArgs {
  const ProfileUpdateRouteArgs({this.key, required this.userEntity});

  final _i14.Key? key;

  final _i16.UserEntity userEntity;

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
/// [_i10.RegisterScreen]
class RegisterRoute extends _i13.PageRouteInfo<void> {
  const RegisterRoute({List<_i13.PageRouteInfo>? children})
    : super(RegisterRoute.name, initialChildren: children);

  static const String name = 'RegisterRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i10.RegisterScreen();
    },
  );
}

/// generated route for
/// [_i11.SplashScreen]
class SplashRoute extends _i13.PageRouteInfo<void> {
  const SplashRoute({List<_i13.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i11.SplashScreen();
    },
  );
}

/// generated route for
/// [_i12.StructureResumeScreen]
class StructureResumeRoute extends _i13.PageRouteInfo<void> {
  const StructureResumeRoute({List<_i13.PageRouteInfo>? children})
    : super(StructureResumeRoute.name, initialChildren: children);

  static const String name = 'StructureResumeRoute';

  static _i13.PageInfo page = _i13.PageInfo(
    name,
    builder: (data) {
      return const _i12.StructureResumeScreen();
    },
  );
}
