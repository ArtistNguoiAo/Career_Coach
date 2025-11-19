// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i16;
import 'package:career_coach/domain/entity/resume_entity.dart' as _i18;
import 'package:career_coach/domain/entity/user_entity.dart' as _i19;
import 'package:career_coach/presentation/screen/auth/login/login_screen.dart'
    as _i6;
import 'package:career_coach/presentation/screen/auth/register/register_screen.dart'
    as _i11;
import 'package:career_coach/presentation/screen/over_view/home/home_screen.dart'
    as _i3;
import 'package:career_coach/presentation/screen/over_view/list_cv_and_cl/list_cv_and_cl_screen.dart'
    as _i4;
import 'package:career_coach/presentation/screen/over_view/list_interview/list_interview_screen.dart'
    as _i5;
import 'package:career_coach/presentation/screen/over_view/over_view_screen.dart'
    as _i7;
import 'package:career_coach/presentation/screen/over_view/preview_resume/preview_resume_screen.dart'
    as _i8;
import 'package:career_coach/presentation/screen/over_view/profile/profile_screen.dart'
    as _i9;
import 'package:career_coach/presentation/screen/over_view/section_resume/avatar/avatar_screen.dart'
    as _i1;
import 'package:career_coach/presentation/screen/over_view/section_resume/contact_information/contact_information_screen.dart'
    as _i2;
import 'package:career_coach/presentation/screen/over_view/section_resume/work_experience/work_experience_detail_screen.dart'
    as _i14;
import 'package:career_coach/presentation/screen/over_view/section_resume/work_experience/work_experience_screen.dart'
    as _i15;
import 'package:career_coach/presentation/screen/over_view/structure_resume/structure_resume_screen.dart'
    as _i13;
import 'package:career_coach/presentation/screen/profile_update/profile_update_screen.dart'
    as _i10;
import 'package:career_coach/presentation/screen/splash/splash_screen.dart'
    as _i12;
import 'package:flutter/material.dart' as _i17;

/// generated route for
/// [_i1.AvatarScreen]
class AvatarRoute extends _i16.PageRouteInfo<void> {
  const AvatarRoute({List<_i16.PageRouteInfo>? children})
    : super(AvatarRoute.name, initialChildren: children);

  static const String name = 'AvatarRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i1.AvatarScreen();
    },
  );
}

/// generated route for
/// [_i2.ContactInformationScreen]
class ContactInformationRoute extends _i16.PageRouteInfo<void> {
  const ContactInformationRoute({List<_i16.PageRouteInfo>? children})
    : super(ContactInformationRoute.name, initialChildren: children);

  static const String name = 'ContactInformationRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i2.ContactInformationScreen();
    },
  );
}

/// generated route for
/// [_i3.HomeScreen]
class HomeRoute extends _i16.PageRouteInfo<void> {
  const HomeRoute({List<_i16.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i3.HomeScreen();
    },
  );
}

/// generated route for
/// [_i4.ListCvAndClScreen]
class ListCvAndClRoute extends _i16.PageRouteInfo<void> {
  const ListCvAndClRoute({List<_i16.PageRouteInfo>? children})
    : super(ListCvAndClRoute.name, initialChildren: children);

  static const String name = 'ListCvAndClRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i4.ListCvAndClScreen();
    },
  );
}

/// generated route for
/// [_i5.ListInterviewScreen]
class ListInterviewRoute extends _i16.PageRouteInfo<ListInterviewRouteArgs> {
  ListInterviewRoute({_i17.Key? key, List<_i16.PageRouteInfo>? children})
    : super(
        ListInterviewRoute.name,
        args: ListInterviewRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'ListInterviewRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ListInterviewRouteArgs>(
        orElse: () => const ListInterviewRouteArgs(),
      );
      return _i5.ListInterviewScreen(key: args.key);
    },
  );
}

class ListInterviewRouteArgs {
  const ListInterviewRouteArgs({this.key});

  final _i17.Key? key;

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
/// [_i6.LoginScreen]
class LoginRoute extends _i16.PageRouteInfo<void> {
  const LoginRoute({List<_i16.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i6.LoginScreen();
    },
  );
}

/// generated route for
/// [_i7.OverViewScreen]
class OverViewRoute extends _i16.PageRouteInfo<void> {
  const OverViewRoute({List<_i16.PageRouteInfo>? children})
    : super(OverViewRoute.name, initialChildren: children);

  static const String name = 'OverViewRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i7.OverViewScreen();
    },
  );
}

/// generated route for
/// [_i8.PreviewResumeScreen]
class PreviewResumeRoute extends _i16.PageRouteInfo<PreviewResumeRouteArgs> {
  PreviewResumeRoute({
    _i17.Key? key,
    required _i18.ResumeEntity resumeEntity,
    List<_i16.PageRouteInfo>? children,
  }) : super(
         PreviewResumeRoute.name,
         args: PreviewResumeRouteArgs(key: key, resumeEntity: resumeEntity),
         initialChildren: children,
       );

  static const String name = 'PreviewResumeRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PreviewResumeRouteArgs>();
      return _i8.PreviewResumeScreen(
        key: args.key,
        resumeEntity: args.resumeEntity,
      );
    },
  );
}

class PreviewResumeRouteArgs {
  const PreviewResumeRouteArgs({this.key, required this.resumeEntity});

  final _i17.Key? key;

  final _i18.ResumeEntity resumeEntity;

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
/// [_i9.ProfileScreen]
class ProfileRoute extends _i16.PageRouteInfo<void> {
  const ProfileRoute({List<_i16.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i9.ProfileScreen();
    },
  );
}

/// generated route for
/// [_i10.ProfileUpdateScreen]
class ProfileUpdateRoute extends _i16.PageRouteInfo<ProfileUpdateRouteArgs> {
  ProfileUpdateRoute({
    _i17.Key? key,
    required _i19.UserEntity userEntity,
    List<_i16.PageRouteInfo>? children,
  }) : super(
         ProfileUpdateRoute.name,
         args: ProfileUpdateRouteArgs(key: key, userEntity: userEntity),
         initialChildren: children,
       );

  static const String name = 'ProfileUpdateRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProfileUpdateRouteArgs>();
      return _i10.ProfileUpdateScreen(
        key: args.key,
        userEntity: args.userEntity,
      );
    },
  );
}

class ProfileUpdateRouteArgs {
  const ProfileUpdateRouteArgs({this.key, required this.userEntity});

  final _i17.Key? key;

  final _i19.UserEntity userEntity;

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
/// [_i11.RegisterScreen]
class RegisterRoute extends _i16.PageRouteInfo<void> {
  const RegisterRoute({List<_i16.PageRouteInfo>? children})
    : super(RegisterRoute.name, initialChildren: children);

  static const String name = 'RegisterRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i11.RegisterScreen();
    },
  );
}

/// generated route for
/// [_i12.SplashScreen]
class SplashRoute extends _i16.PageRouteInfo<void> {
  const SplashRoute({List<_i16.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i12.SplashScreen();
    },
  );
}

/// generated route for
/// [_i13.StructureResumeScreen]
class StructureResumeRoute extends _i16.PageRouteInfo<void> {
  const StructureResumeRoute({List<_i16.PageRouteInfo>? children})
    : super(StructureResumeRoute.name, initialChildren: children);

  static const String name = 'StructureResumeRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i13.StructureResumeScreen();
    },
  );
}

/// generated route for
/// [_i14.WorkExperienceDetailScreen]
class WorkExperienceDetailRoute extends _i16.PageRouteInfo<void> {
  const WorkExperienceDetailRoute({List<_i16.PageRouteInfo>? children})
    : super(WorkExperienceDetailRoute.name, initialChildren: children);

  static const String name = 'WorkExperienceDetailRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i14.WorkExperienceDetailScreen();
    },
  );
}

/// generated route for
/// [_i15.WorkExperienceScreen]
class WorkExperienceRoute extends _i16.PageRouteInfo<void> {
  const WorkExperienceRoute({List<_i16.PageRouteInfo>? children})
    : super(WorkExperienceRoute.name, initialChildren: children);

  static const String name = 'WorkExperienceRoute';

  static _i16.PageInfo page = _i16.PageInfo(
    name,
    builder: (data) {
      return const _i15.WorkExperienceScreen();
    },
  );
}
