// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i24;
import 'package:career_coach/domain/entity/user_entity.dart' as _i27;
import 'package:career_coach/domain/entity/user_resume_entity.dart' as _i26;
import 'package:career_coach/presentation/screen/auth/login/login_screen.dart'
    as _i12;
import 'package:career_coach/presentation/screen/auth/register/register_screen.dart'
    as _i20;
import 'package:career_coach/presentation/screen/layout_resume/layout_resume_screen.dart'
    as _i10;
import 'package:career_coach/presentation/screen/manage_user_resume/manage_user_resume_screen.dart'
    as _i13;
import 'package:career_coach/presentation/screen/over_view/home/home_screen.dart'
    as _i9;
import 'package:career_coach/presentation/screen/over_view/list_interview/list_interview_screen.dart'
    as _i11;
import 'package:career_coach/presentation/screen/over_view/over_view_screen.dart'
    as _i15;
import 'package:career_coach/presentation/screen/over_view/profile/profile_screen.dart'
    as _i17;
import 'package:career_coach/presentation/screen/preview_resume/preview_resume_screen.dart'
    as _i16;
import 'package:career_coach/presentation/screen/profile_update/profile_update_screen.dart'
    as _i18;
import 'package:career_coach/presentation/screen/section_resume/activity/activity_screen.dart'
    as _i1;
import 'package:career_coach/presentation/screen/section_resume/avatar/avatar_screen.dart'
    as _i2;
import 'package:career_coach/presentation/screen/section_resume/award/award_screen.dart'
    as _i3;
import 'package:career_coach/presentation/screen/section_resume/certificate/certificate_screen.dart'
    as _i4;
import 'package:career_coach/presentation/screen/section_resume/contact_information/contact_information_screen.dart'
    as _i5;
import 'package:career_coach/presentation/screen/section_resume/education/education_screen.dart'
    as _i6;
import 'package:career_coach/presentation/screen/section_resume/favorite/favorite_screen.dart'
    as _i7;
import 'package:career_coach/presentation/screen/section_resume/goal/goal_screen.dart'
    as _i8;
import 'package:career_coach/presentation/screen/section_resume/other_information/other_information_screen.dart'
    as _i14;
import 'package:career_coach/presentation/screen/section_resume/project/project_screen.dart'
    as _i19;
import 'package:career_coach/presentation/screen/section_resume/skill/skill_screen.dart'
    as _i21;
import 'package:career_coach/presentation/screen/section_resume/work_experience/work_experience_screen.dart'
    as _i23;
import 'package:career_coach/presentation/screen/splash/splash_screen.dart'
    as _i22;
import 'package:flutter/material.dart' as _i25;

/// generated route for
/// [_i1.ActivityScreen]
class ActivityRoute extends _i24.PageRouteInfo<ActivityRouteArgs> {
  ActivityRoute({
    _i25.Key? key,
    required int userResumeId,
    List<_i24.PageRouteInfo>? children,
  }) : super(
         ActivityRoute.name,
         args: ActivityRouteArgs(key: key, userResumeId: userResumeId),
         initialChildren: children,
       );

  static const String name = 'ActivityRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ActivityRouteArgs>();
      return _i1.ActivityScreen(key: args.key, userResumeId: args.userResumeId);
    },
  );
}

class ActivityRouteArgs {
  const ActivityRouteArgs({this.key, required this.userResumeId});

  final _i25.Key? key;

  final int userResumeId;

  @override
  String toString() {
    return 'ActivityRouteArgs{key: $key, userResumeId: $userResumeId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ActivityRouteArgs) return false;
    return key == other.key && userResumeId == other.userResumeId;
  }

  @override
  int get hashCode => key.hashCode ^ userResumeId.hashCode;
}

/// generated route for
/// [_i2.AvatarScreen]
class AvatarRoute extends _i24.PageRouteInfo<void> {
  const AvatarRoute({List<_i24.PageRouteInfo>? children})
    : super(AvatarRoute.name, initialChildren: children);

  static const String name = 'AvatarRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i2.AvatarScreen();
    },
  );
}

/// generated route for
/// [_i3.AwardScreen]
class AwardRoute extends _i24.PageRouteInfo<AwardRouteArgs> {
  AwardRoute({
    _i25.Key? key,
    required int userResumeId,
    List<_i24.PageRouteInfo>? children,
  }) : super(
         AwardRoute.name,
         args: AwardRouteArgs(key: key, userResumeId: userResumeId),
         initialChildren: children,
       );

  static const String name = 'AwardRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AwardRouteArgs>();
      return _i3.AwardScreen(key: args.key, userResumeId: args.userResumeId);
    },
  );
}

class AwardRouteArgs {
  const AwardRouteArgs({this.key, required this.userResumeId});

  final _i25.Key? key;

  final int userResumeId;

  @override
  String toString() {
    return 'AwardRouteArgs{key: $key, userResumeId: $userResumeId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! AwardRouteArgs) return false;
    return key == other.key && userResumeId == other.userResumeId;
  }

  @override
  int get hashCode => key.hashCode ^ userResumeId.hashCode;
}

/// generated route for
/// [_i4.CertificateScreen]
class CertificateRoute extends _i24.PageRouteInfo<CertificateRouteArgs> {
  CertificateRoute({
    _i25.Key? key,
    required int userResumeId,
    List<_i24.PageRouteInfo>? children,
  }) : super(
         CertificateRoute.name,
         args: CertificateRouteArgs(key: key, userResumeId: userResumeId),
         initialChildren: children,
       );

  static const String name = 'CertificateRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CertificateRouteArgs>();
      return _i4.CertificateScreen(
        key: args.key,
        userResumeId: args.userResumeId,
      );
    },
  );
}

class CertificateRouteArgs {
  const CertificateRouteArgs({this.key, required this.userResumeId});

  final _i25.Key? key;

  final int userResumeId;

  @override
  String toString() {
    return 'CertificateRouteArgs{key: $key, userResumeId: $userResumeId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CertificateRouteArgs) return false;
    return key == other.key && userResumeId == other.userResumeId;
  }

  @override
  int get hashCode => key.hashCode ^ userResumeId.hashCode;
}

/// generated route for
/// [_i5.ContactInformationScreen]
class ContactInformationRoute
    extends _i24.PageRouteInfo<ContactInformationRouteArgs> {
  ContactInformationRoute({
    _i25.Key? key,
    required int userResumeId,
    List<_i24.PageRouteInfo>? children,
  }) : super(
         ContactInformationRoute.name,
         args: ContactInformationRouteArgs(
           key: key,
           userResumeId: userResumeId,
         ),
         initialChildren: children,
       );

  static const String name = 'ContactInformationRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ContactInformationRouteArgs>();
      return _i5.ContactInformationScreen(
        key: args.key,
        userResumeId: args.userResumeId,
      );
    },
  );
}

class ContactInformationRouteArgs {
  const ContactInformationRouteArgs({this.key, required this.userResumeId});

  final _i25.Key? key;

  final int userResumeId;

  @override
  String toString() {
    return 'ContactInformationRouteArgs{key: $key, userResumeId: $userResumeId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ContactInformationRouteArgs) return false;
    return key == other.key && userResumeId == other.userResumeId;
  }

  @override
  int get hashCode => key.hashCode ^ userResumeId.hashCode;
}

/// generated route for
/// [_i6.EducationScreen]
class EducationRoute extends _i24.PageRouteInfo<EducationRouteArgs> {
  EducationRoute({
    _i25.Key? key,
    required int userResumeId,
    List<_i24.PageRouteInfo>? children,
  }) : super(
         EducationRoute.name,
         args: EducationRouteArgs(key: key, userResumeId: userResumeId),
         initialChildren: children,
       );

  static const String name = 'EducationRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EducationRouteArgs>();
      return _i6.EducationScreen(
        key: args.key,
        userResumeId: args.userResumeId,
      );
    },
  );
}

class EducationRouteArgs {
  const EducationRouteArgs({this.key, required this.userResumeId});

  final _i25.Key? key;

  final int userResumeId;

  @override
  String toString() {
    return 'EducationRouteArgs{key: $key, userResumeId: $userResumeId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! EducationRouteArgs) return false;
    return key == other.key && userResumeId == other.userResumeId;
  }

  @override
  int get hashCode => key.hashCode ^ userResumeId.hashCode;
}

/// generated route for
/// [_i7.FavoriteScreen]
class FavoriteRoute extends _i24.PageRouteInfo<FavoriteRouteArgs> {
  FavoriteRoute({
    _i25.Key? key,
    required int userResumeId,
    List<_i24.PageRouteInfo>? children,
  }) : super(
         FavoriteRoute.name,
         args: FavoriteRouteArgs(key: key, userResumeId: userResumeId),
         initialChildren: children,
       );

  static const String name = 'FavoriteRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FavoriteRouteArgs>();
      return _i7.FavoriteScreen(key: args.key, userResumeId: args.userResumeId);
    },
  );
}

class FavoriteRouteArgs {
  const FavoriteRouteArgs({this.key, required this.userResumeId});

  final _i25.Key? key;

  final int userResumeId;

  @override
  String toString() {
    return 'FavoriteRouteArgs{key: $key, userResumeId: $userResumeId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! FavoriteRouteArgs) return false;
    return key == other.key && userResumeId == other.userResumeId;
  }

  @override
  int get hashCode => key.hashCode ^ userResumeId.hashCode;
}

/// generated route for
/// [_i8.GoalScreen]
class GoalRoute extends _i24.PageRouteInfo<GoalRouteArgs> {
  GoalRoute({
    _i25.Key? key,
    required int userResumeId,
    List<_i24.PageRouteInfo>? children,
  }) : super(
         GoalRoute.name,
         args: GoalRouteArgs(key: key, userResumeId: userResumeId),
         initialChildren: children,
       );

  static const String name = 'GoalRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<GoalRouteArgs>();
      return _i8.GoalScreen(key: args.key, userResumeId: args.userResumeId);
    },
  );
}

class GoalRouteArgs {
  const GoalRouteArgs({this.key, required this.userResumeId});

  final _i25.Key? key;

  final int userResumeId;

  @override
  String toString() {
    return 'GoalRouteArgs{key: $key, userResumeId: $userResumeId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! GoalRouteArgs) return false;
    return key == other.key && userResumeId == other.userResumeId;
  }

  @override
  int get hashCode => key.hashCode ^ userResumeId.hashCode;
}

/// generated route for
/// [_i9.HomeScreen]
class HomeRoute extends _i24.PageRouteInfo<void> {
  const HomeRoute({List<_i24.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i9.HomeScreen();
    },
  );
}

/// generated route for
/// [_i10.LayoutResumeScreen]
class LayoutResumeRoute extends _i24.PageRouteInfo<LayoutResumeRouteArgs> {
  LayoutResumeRoute({
    _i25.Key? key,
    required _i26.UserResumeEntity userResumeEntity,
    List<_i24.PageRouteInfo>? children,
  }) : super(
         LayoutResumeRoute.name,
         args: LayoutResumeRouteArgs(
           key: key,
           userResumeEntity: userResumeEntity,
         ),
         initialChildren: children,
       );

  static const String name = 'LayoutResumeRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LayoutResumeRouteArgs>();
      return _i10.LayoutResumeScreen(
        key: args.key,
        userResumeEntity: args.userResumeEntity,
      );
    },
  );
}

class LayoutResumeRouteArgs {
  const LayoutResumeRouteArgs({this.key, required this.userResumeEntity});

  final _i25.Key? key;

  final _i26.UserResumeEntity userResumeEntity;

  @override
  String toString() {
    return 'LayoutResumeRouteArgs{key: $key, userResumeEntity: $userResumeEntity}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! LayoutResumeRouteArgs) return false;
    return key == other.key && userResumeEntity == other.userResumeEntity;
  }

  @override
  int get hashCode => key.hashCode ^ userResumeEntity.hashCode;
}

/// generated route for
/// [_i11.ListInterviewScreen]
class ListInterviewRoute extends _i24.PageRouteInfo<void> {
  const ListInterviewRoute({List<_i24.PageRouteInfo>? children})
    : super(ListInterviewRoute.name, initialChildren: children);

  static const String name = 'ListInterviewRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i11.ListInterviewScreen();
    },
  );
}

/// generated route for
/// [_i12.LoginScreen]
class LoginRoute extends _i24.PageRouteInfo<void> {
  const LoginRoute({List<_i24.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i12.LoginScreen();
    },
  );
}

/// generated route for
/// [_i13.ManageUserResumeScreen]
class ManageUserResumeRoute extends _i24.PageRouteInfo<void> {
  const ManageUserResumeRoute({List<_i24.PageRouteInfo>? children})
    : super(ManageUserResumeRoute.name, initialChildren: children);

  static const String name = 'ManageUserResumeRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i13.ManageUserResumeScreen();
    },
  );
}

/// generated route for
/// [_i14.OtherInformationScreen]
class OtherInformationRoute
    extends _i24.PageRouteInfo<OtherInformationRouteArgs> {
  OtherInformationRoute({
    _i25.Key? key,
    required int userResumeId,
    List<_i24.PageRouteInfo>? children,
  }) : super(
         OtherInformationRoute.name,
         args: OtherInformationRouteArgs(key: key, userResumeId: userResumeId),
         initialChildren: children,
       );

  static const String name = 'OtherInformationRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OtherInformationRouteArgs>();
      return _i14.OtherInformationScreen(
        key: args.key,
        userResumeId: args.userResumeId,
      );
    },
  );
}

class OtherInformationRouteArgs {
  const OtherInformationRouteArgs({this.key, required this.userResumeId});

  final _i25.Key? key;

  final int userResumeId;

  @override
  String toString() {
    return 'OtherInformationRouteArgs{key: $key, userResumeId: $userResumeId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! OtherInformationRouteArgs) return false;
    return key == other.key && userResumeId == other.userResumeId;
  }

  @override
  int get hashCode => key.hashCode ^ userResumeId.hashCode;
}

/// generated route for
/// [_i15.OverViewScreen]
class OverViewRoute extends _i24.PageRouteInfo<void> {
  const OverViewRoute({List<_i24.PageRouteInfo>? children})
    : super(OverViewRoute.name, initialChildren: children);

  static const String name = 'OverViewRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i15.OverViewScreen();
    },
  );
}

/// generated route for
/// [_i16.PreviewResumeScreen]
class PreviewResumeRoute extends _i24.PageRouteInfo<PreviewResumeRouteArgs> {
  PreviewResumeRoute({
    _i25.Key? key,
    int? resumeId,
    int? userResumeId,
    required bool isCreateNew,
    List<_i24.PageRouteInfo>? children,
  }) : super(
         PreviewResumeRoute.name,
         args: PreviewResumeRouteArgs(
           key: key,
           resumeId: resumeId,
           userResumeId: userResumeId,
           isCreateNew: isCreateNew,
         ),
         initialChildren: children,
       );

  static const String name = 'PreviewResumeRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PreviewResumeRouteArgs>();
      return _i16.PreviewResumeScreen(
        key: args.key,
        resumeId: args.resumeId,
        userResumeId: args.userResumeId,
        isCreateNew: args.isCreateNew,
      );
    },
  );
}

class PreviewResumeRouteArgs {
  const PreviewResumeRouteArgs({
    this.key,
    this.resumeId,
    this.userResumeId,
    required this.isCreateNew,
  });

  final _i25.Key? key;

  final int? resumeId;

  final int? userResumeId;

  final bool isCreateNew;

  @override
  String toString() {
    return 'PreviewResumeRouteArgs{key: $key, resumeId: $resumeId, userResumeId: $userResumeId, isCreateNew: $isCreateNew}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PreviewResumeRouteArgs) return false;
    return key == other.key &&
        resumeId == other.resumeId &&
        userResumeId == other.userResumeId &&
        isCreateNew == other.isCreateNew;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      resumeId.hashCode ^
      userResumeId.hashCode ^
      isCreateNew.hashCode;
}

/// generated route for
/// [_i17.ProfileScreen]
class ProfileRoute extends _i24.PageRouteInfo<void> {
  const ProfileRoute({List<_i24.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i17.ProfileScreen();
    },
  );
}

/// generated route for
/// [_i18.ProfileUpdateScreen]
class ProfileUpdateRoute extends _i24.PageRouteInfo<ProfileUpdateRouteArgs> {
  ProfileUpdateRoute({
    _i25.Key? key,
    required _i27.UserEntity userEntity,
    List<_i24.PageRouteInfo>? children,
  }) : super(
         ProfileUpdateRoute.name,
         args: ProfileUpdateRouteArgs(key: key, userEntity: userEntity),
         initialChildren: children,
       );

  static const String name = 'ProfileUpdateRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProfileUpdateRouteArgs>();
      return _i18.ProfileUpdateScreen(
        key: args.key,
        userEntity: args.userEntity,
      );
    },
  );
}

class ProfileUpdateRouteArgs {
  const ProfileUpdateRouteArgs({this.key, required this.userEntity});

  final _i25.Key? key;

  final _i27.UserEntity userEntity;

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
/// [_i19.ProjectScreen]
class ProjectRoute extends _i24.PageRouteInfo<ProjectRouteArgs> {
  ProjectRoute({
    _i25.Key? key,
    required int userResumeId,
    List<_i24.PageRouteInfo>? children,
  }) : super(
         ProjectRoute.name,
         args: ProjectRouteArgs(key: key, userResumeId: userResumeId),
         initialChildren: children,
       );

  static const String name = 'ProjectRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProjectRouteArgs>();
      return _i19.ProjectScreen(key: args.key, userResumeId: args.userResumeId);
    },
  );
}

class ProjectRouteArgs {
  const ProjectRouteArgs({this.key, required this.userResumeId});

  final _i25.Key? key;

  final int userResumeId;

  @override
  String toString() {
    return 'ProjectRouteArgs{key: $key, userResumeId: $userResumeId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! ProjectRouteArgs) return false;
    return key == other.key && userResumeId == other.userResumeId;
  }

  @override
  int get hashCode => key.hashCode ^ userResumeId.hashCode;
}

/// generated route for
/// [_i20.RegisterScreen]
class RegisterRoute extends _i24.PageRouteInfo<void> {
  const RegisterRoute({List<_i24.PageRouteInfo>? children})
    : super(RegisterRoute.name, initialChildren: children);

  static const String name = 'RegisterRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i20.RegisterScreen();
    },
  );
}

/// generated route for
/// [_i21.SkillScreen]
class SkillRoute extends _i24.PageRouteInfo<SkillRouteArgs> {
  SkillRoute({
    _i25.Key? key,
    required int userResumeId,
    List<_i24.PageRouteInfo>? children,
  }) : super(
         SkillRoute.name,
         args: SkillRouteArgs(key: key, userResumeId: userResumeId),
         initialChildren: children,
       );

  static const String name = 'SkillRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SkillRouteArgs>();
      return _i21.SkillScreen(key: args.key, userResumeId: args.userResumeId);
    },
  );
}

class SkillRouteArgs {
  const SkillRouteArgs({this.key, required this.userResumeId});

  final _i25.Key? key;

  final int userResumeId;

  @override
  String toString() {
    return 'SkillRouteArgs{key: $key, userResumeId: $userResumeId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! SkillRouteArgs) return false;
    return key == other.key && userResumeId == other.userResumeId;
  }

  @override
  int get hashCode => key.hashCode ^ userResumeId.hashCode;
}

/// generated route for
/// [_i22.SplashScreen]
class SplashRoute extends _i24.PageRouteInfo<void> {
  const SplashRoute({List<_i24.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      return const _i22.SplashScreen();
    },
  );
}

/// generated route for
/// [_i23.WorkExperienceScreen]
class WorkExperienceRoute extends _i24.PageRouteInfo<WorkExperienceRouteArgs> {
  WorkExperienceRoute({
    _i25.Key? key,
    required int userResumeId,
    List<_i24.PageRouteInfo>? children,
  }) : super(
         WorkExperienceRoute.name,
         args: WorkExperienceRouteArgs(key: key, userResumeId: userResumeId),
         initialChildren: children,
       );

  static const String name = 'WorkExperienceRoute';

  static _i24.PageInfo page = _i24.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<WorkExperienceRouteArgs>();
      return _i23.WorkExperienceScreen(
        key: args.key,
        userResumeId: args.userResumeId,
      );
    },
  );
}

class WorkExperienceRouteArgs {
  const WorkExperienceRouteArgs({this.key, required this.userResumeId});

  final _i25.Key? key;

  final int userResumeId;

  @override
  String toString() {
    return 'WorkExperienceRouteArgs{key: $key, userResumeId: $userResumeId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! WorkExperienceRouteArgs) return false;
    return key == other.key && userResumeId == other.userResumeId;
  }

  @override
  int get hashCode => key.hashCode ^ userResumeId.hashCode;
}
