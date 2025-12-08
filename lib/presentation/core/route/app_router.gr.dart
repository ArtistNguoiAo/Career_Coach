// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i29;
import 'package:career_coach/domain/entity/user_entity.dart' as _i32;
import 'package:career_coach/domain/entity/user_resume_entity.dart' as _i31;
import 'package:career_coach/presentation/screen/auth/login/login_screen.dart'
    as _i15;
import 'package:career_coach/presentation/screen/auth/register/register_screen.dart'
    as _i24;
import 'package:career_coach/presentation/screen/layout_resume/layout_resume_screen.dart'
    as _i13;
import 'package:career_coach/presentation/screen/manage_user_resume/manage_user_resume_screen.dart'
    as _i16;
import 'package:career_coach/presentation/screen/over_view/home/home_screen.dart'
    as _i12;
import 'package:career_coach/presentation/screen/over_view/list_interview/list_interview_screen.dart'
    as _i14;
import 'package:career_coach/presentation/screen/over_view/over_view_screen.dart'
    as _i18;
import 'package:career_coach/presentation/screen/over_view/profile/profile_screen.dart'
    as _i20;
import 'package:career_coach/presentation/screen/preview_resume/preview_resume_screen.dart'
    as _i19;
import 'package:career_coach/presentation/screen/profile_update/profile_update_screen.dart'
    as _i21;
import 'package:career_coach/presentation/screen/section_resume/activity/activity_screen.dart'
    as _i1;
import 'package:career_coach/presentation/screen/section_resume/avatar/avatar_screen.dart'
    as _i2;
import 'package:career_coach/presentation/screen/section_resume/award/award_detail_screen.dart'
    as _i3;
import 'package:career_coach/presentation/screen/section_resume/award/award_screen.dart'
    as _i4;
import 'package:career_coach/presentation/screen/section_resume/certificate/certificate_screen.dart'
    as _i5;
import 'package:career_coach/presentation/screen/section_resume/contact_information/contact_information_screen.dart'
    as _i6;
import 'package:career_coach/presentation/screen/section_resume/education/education_detail_screen.dart'
    as _i7;
import 'package:career_coach/presentation/screen/section_resume/education/education_screen.dart'
    as _i8;
import 'package:career_coach/presentation/screen/section_resume/favorite/favorite_detail_screen.dart'
    as _i9;
import 'package:career_coach/presentation/screen/section_resume/favorite/favorite_screen.dart'
    as _i10;
import 'package:career_coach/presentation/screen/section_resume/goal/goal_screen.dart'
    as _i11;
import 'package:career_coach/presentation/screen/section_resume/other_information/other_information_screen.dart'
    as _i17;
import 'package:career_coach/presentation/screen/section_resume/project/project_detail_screen.dart'
    as _i22;
import 'package:career_coach/presentation/screen/section_resume/project/project_screen.dart'
    as _i23;
import 'package:career_coach/presentation/screen/section_resume/skill/skill_screen.dart'
    as _i25;
import 'package:career_coach/presentation/screen/section_resume/work_experience/work_experience_detail_screen.dart'
    as _i27;
import 'package:career_coach/presentation/screen/section_resume/work_experience/work_experience_screen.dart'
    as _i28;
import 'package:career_coach/presentation/screen/splash/splash_screen.dart'
    as _i26;
import 'package:flutter/material.dart' as _i30;

/// generated route for
/// [_i1.ActivityScreen]
class ActivityRoute extends _i29.PageRouteInfo<ActivityRouteArgs> {
  ActivityRoute({
    _i30.Key? key,
    required int userResumeId,
    List<_i29.PageRouteInfo>? children,
  }) : super(
         ActivityRoute.name,
         args: ActivityRouteArgs(key: key, userResumeId: userResumeId),
         initialChildren: children,
       );

  static const String name = 'ActivityRoute';

  static _i29.PageInfo page = _i29.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ActivityRouteArgs>();
      return _i1.ActivityScreen(key: args.key, userResumeId: args.userResumeId);
    },
  );
}

class ActivityRouteArgs {
  const ActivityRouteArgs({this.key, required this.userResumeId});

  final _i30.Key? key;

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
class AvatarRoute extends _i29.PageRouteInfo<void> {
  const AvatarRoute({List<_i29.PageRouteInfo>? children})
    : super(AvatarRoute.name, initialChildren: children);

  static const String name = 'AvatarRoute';

  static _i29.PageInfo page = _i29.PageInfo(
    name,
    builder: (data) {
      return const _i2.AvatarScreen();
    },
  );
}

/// generated route for
/// [_i3.AwardDetailScreen]
class AwardDetailRoute extends _i29.PageRouteInfo<void> {
  const AwardDetailRoute({List<_i29.PageRouteInfo>? children})
    : super(AwardDetailRoute.name, initialChildren: children);

  static const String name = 'AwardDetailRoute';

  static _i29.PageInfo page = _i29.PageInfo(
    name,
    builder: (data) {
      return const _i3.AwardDetailScreen();
    },
  );
}

/// generated route for
/// [_i4.AwardScreen]
class AwardRoute extends _i29.PageRouteInfo<void> {
  const AwardRoute({List<_i29.PageRouteInfo>? children})
    : super(AwardRoute.name, initialChildren: children);

  static const String name = 'AwardRoute';

  static _i29.PageInfo page = _i29.PageInfo(
    name,
    builder: (data) {
      return const _i4.AwardScreen();
    },
  );
}

/// generated route for
/// [_i5.CertificateScreen]
class CertificateRoute extends _i29.PageRouteInfo<CertificateRouteArgs> {
  CertificateRoute({
    _i30.Key? key,
    required int userResumeId,
    List<_i29.PageRouteInfo>? children,
  }) : super(
         CertificateRoute.name,
         args: CertificateRouteArgs(key: key, userResumeId: userResumeId),
         initialChildren: children,
       );

  static const String name = 'CertificateRoute';

  static _i29.PageInfo page = _i29.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CertificateRouteArgs>();
      return _i5.CertificateScreen(
        key: args.key,
        userResumeId: args.userResumeId,
      );
    },
  );
}

class CertificateRouteArgs {
  const CertificateRouteArgs({this.key, required this.userResumeId});

  final _i30.Key? key;

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
/// [_i6.ContactInformationScreen]
class ContactInformationRoute
    extends _i29.PageRouteInfo<ContactInformationRouteArgs> {
  ContactInformationRoute({
    _i30.Key? key,
    required int userResumeId,
    List<_i29.PageRouteInfo>? children,
  }) : super(
         ContactInformationRoute.name,
         args: ContactInformationRouteArgs(
           key: key,
           userResumeId: userResumeId,
         ),
         initialChildren: children,
       );

  static const String name = 'ContactInformationRoute';

  static _i29.PageInfo page = _i29.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ContactInformationRouteArgs>();
      return _i6.ContactInformationScreen(
        key: args.key,
        userResumeId: args.userResumeId,
      );
    },
  );
}

class ContactInformationRouteArgs {
  const ContactInformationRouteArgs({this.key, required this.userResumeId});

  final _i30.Key? key;

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
/// [_i7.EducationDetailScreen]
class EducationDetailRoute extends _i29.PageRouteInfo<void> {
  const EducationDetailRoute({List<_i29.PageRouteInfo>? children})
    : super(EducationDetailRoute.name, initialChildren: children);

  static const String name = 'EducationDetailRoute';

  static _i29.PageInfo page = _i29.PageInfo(
    name,
    builder: (data) {
      return const _i7.EducationDetailScreen();
    },
  );
}

/// generated route for
/// [_i8.EducationScreen]
class EducationRoute extends _i29.PageRouteInfo<void> {
  const EducationRoute({List<_i29.PageRouteInfo>? children})
    : super(EducationRoute.name, initialChildren: children);

  static const String name = 'EducationRoute';

  static _i29.PageInfo page = _i29.PageInfo(
    name,
    builder: (data) {
      return const _i8.EducationScreen();
    },
  );
}

/// generated route for
/// [_i9.FavoriteDetailScreen]
class FavoriteDetailRoute extends _i29.PageRouteInfo<void> {
  const FavoriteDetailRoute({List<_i29.PageRouteInfo>? children})
    : super(FavoriteDetailRoute.name, initialChildren: children);

  static const String name = 'FavoriteDetailRoute';

  static _i29.PageInfo page = _i29.PageInfo(
    name,
    builder: (data) {
      return const _i9.FavoriteDetailScreen();
    },
  );
}

/// generated route for
/// [_i10.FavoriteScreen]
class FavoriteRoute extends _i29.PageRouteInfo<void> {
  const FavoriteRoute({List<_i29.PageRouteInfo>? children})
    : super(FavoriteRoute.name, initialChildren: children);

  static const String name = 'FavoriteRoute';

  static _i29.PageInfo page = _i29.PageInfo(
    name,
    builder: (data) {
      return const _i10.FavoriteScreen();
    },
  );
}

/// generated route for
/// [_i11.GoalScreen]
class GoalRoute extends _i29.PageRouteInfo<GoalRouteArgs> {
  GoalRoute({
    _i30.Key? key,
    required int userResumeId,
    List<_i29.PageRouteInfo>? children,
  }) : super(
         GoalRoute.name,
         args: GoalRouteArgs(key: key, userResumeId: userResumeId),
         initialChildren: children,
       );

  static const String name = 'GoalRoute';

  static _i29.PageInfo page = _i29.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<GoalRouteArgs>();
      return _i11.GoalScreen(key: args.key, userResumeId: args.userResumeId);
    },
  );
}

class GoalRouteArgs {
  const GoalRouteArgs({this.key, required this.userResumeId});

  final _i30.Key? key;

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
/// [_i12.HomeScreen]
class HomeRoute extends _i29.PageRouteInfo<void> {
  const HomeRoute({List<_i29.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i29.PageInfo page = _i29.PageInfo(
    name,
    builder: (data) {
      return const _i12.HomeScreen();
    },
  );
}

/// generated route for
/// [_i13.LayoutResumeScreen]
class LayoutResumeRoute extends _i29.PageRouteInfo<LayoutResumeRouteArgs> {
  LayoutResumeRoute({
    _i30.Key? key,
    required _i31.UserResumeEntity userResumeEntity,
    List<_i29.PageRouteInfo>? children,
  }) : super(
         LayoutResumeRoute.name,
         args: LayoutResumeRouteArgs(
           key: key,
           userResumeEntity: userResumeEntity,
         ),
         initialChildren: children,
       );

  static const String name = 'LayoutResumeRoute';

  static _i29.PageInfo page = _i29.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LayoutResumeRouteArgs>();
      return _i13.LayoutResumeScreen(
        key: args.key,
        userResumeEntity: args.userResumeEntity,
      );
    },
  );
}

class LayoutResumeRouteArgs {
  const LayoutResumeRouteArgs({this.key, required this.userResumeEntity});

  final _i30.Key? key;

  final _i31.UserResumeEntity userResumeEntity;

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
/// [_i14.ListInterviewScreen]
class ListInterviewRoute extends _i29.PageRouteInfo<ListInterviewRouteArgs> {
  ListInterviewRoute({_i30.Key? key, List<_i29.PageRouteInfo>? children})
    : super(
        ListInterviewRoute.name,
        args: ListInterviewRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'ListInterviewRoute';

  static _i29.PageInfo page = _i29.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ListInterviewRouteArgs>(
        orElse: () => const ListInterviewRouteArgs(),
      );
      return _i14.ListInterviewScreen(key: args.key);
    },
  );
}

class ListInterviewRouteArgs {
  const ListInterviewRouteArgs({this.key});

  final _i30.Key? key;

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
/// [_i15.LoginScreen]
class LoginRoute extends _i29.PageRouteInfo<void> {
  const LoginRoute({List<_i29.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i29.PageInfo page = _i29.PageInfo(
    name,
    builder: (data) {
      return const _i15.LoginScreen();
    },
  );
}

/// generated route for
/// [_i16.ManageUserResumeScreen]
class ManageUserResumeRoute extends _i29.PageRouteInfo<void> {
  const ManageUserResumeRoute({List<_i29.PageRouteInfo>? children})
    : super(ManageUserResumeRoute.name, initialChildren: children);

  static const String name = 'ManageUserResumeRoute';

  static _i29.PageInfo page = _i29.PageInfo(
    name,
    builder: (data) {
      return const _i16.ManageUserResumeScreen();
    },
  );
}

/// generated route for
/// [_i17.OtherInformationScreen]
class OtherInformationRoute extends _i29.PageRouteInfo<void> {
  const OtherInformationRoute({List<_i29.PageRouteInfo>? children})
    : super(OtherInformationRoute.name, initialChildren: children);

  static const String name = 'OtherInformationRoute';

  static _i29.PageInfo page = _i29.PageInfo(
    name,
    builder: (data) {
      return const _i17.OtherInformationScreen();
    },
  );
}

/// generated route for
/// [_i18.OverViewScreen]
class OverViewRoute extends _i29.PageRouteInfo<void> {
  const OverViewRoute({List<_i29.PageRouteInfo>? children})
    : super(OverViewRoute.name, initialChildren: children);

  static const String name = 'OverViewRoute';

  static _i29.PageInfo page = _i29.PageInfo(
    name,
    builder: (data) {
      return const _i18.OverViewScreen();
    },
  );
}

/// generated route for
/// [_i19.PreviewResumeScreen]
class PreviewResumeRoute extends _i29.PageRouteInfo<PreviewResumeRouteArgs> {
  PreviewResumeRoute({
    _i30.Key? key,
    int? resumeId,
    int? userResumeId,
    required bool isCreateNew,
    List<_i29.PageRouteInfo>? children,
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

  static _i29.PageInfo page = _i29.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PreviewResumeRouteArgs>();
      return _i19.PreviewResumeScreen(
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

  final _i30.Key? key;

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
/// [_i20.ProfileScreen]
class ProfileRoute extends _i29.PageRouteInfo<void> {
  const ProfileRoute({List<_i29.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i29.PageInfo page = _i29.PageInfo(
    name,
    builder: (data) {
      return const _i20.ProfileScreen();
    },
  );
}

/// generated route for
/// [_i21.ProfileUpdateScreen]
class ProfileUpdateRoute extends _i29.PageRouteInfo<ProfileUpdateRouteArgs> {
  ProfileUpdateRoute({
    _i30.Key? key,
    required _i32.UserEntity userEntity,
    List<_i29.PageRouteInfo>? children,
  }) : super(
         ProfileUpdateRoute.name,
         args: ProfileUpdateRouteArgs(key: key, userEntity: userEntity),
         initialChildren: children,
       );

  static const String name = 'ProfileUpdateRoute';

  static _i29.PageInfo page = _i29.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProfileUpdateRouteArgs>();
      return _i21.ProfileUpdateScreen(
        key: args.key,
        userEntity: args.userEntity,
      );
    },
  );
}

class ProfileUpdateRouteArgs {
  const ProfileUpdateRouteArgs({this.key, required this.userEntity});

  final _i30.Key? key;

  final _i32.UserEntity userEntity;

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
/// [_i22.ProjectDetailScreen]
class ProjectDetailRoute extends _i29.PageRouteInfo<void> {
  const ProjectDetailRoute({List<_i29.PageRouteInfo>? children})
    : super(ProjectDetailRoute.name, initialChildren: children);

  static const String name = 'ProjectDetailRoute';

  static _i29.PageInfo page = _i29.PageInfo(
    name,
    builder: (data) {
      return const _i22.ProjectDetailScreen();
    },
  );
}

/// generated route for
/// [_i23.ProjectScreen]
class ProjectRoute extends _i29.PageRouteInfo<void> {
  const ProjectRoute({List<_i29.PageRouteInfo>? children})
    : super(ProjectRoute.name, initialChildren: children);

  static const String name = 'ProjectRoute';

  static _i29.PageInfo page = _i29.PageInfo(
    name,
    builder: (data) {
      return const _i23.ProjectScreen();
    },
  );
}

/// generated route for
/// [_i24.RegisterScreen]
class RegisterRoute extends _i29.PageRouteInfo<void> {
  const RegisterRoute({List<_i29.PageRouteInfo>? children})
    : super(RegisterRoute.name, initialChildren: children);

  static const String name = 'RegisterRoute';

  static _i29.PageInfo page = _i29.PageInfo(
    name,
    builder: (data) {
      return const _i24.RegisterScreen();
    },
  );
}

/// generated route for
/// [_i25.SkillScreen]
class SkillRoute extends _i29.PageRouteInfo<SkillRouteArgs> {
  SkillRoute({
    _i30.Key? key,
    required int userResumeId,
    List<_i29.PageRouteInfo>? children,
  }) : super(
         SkillRoute.name,
         args: SkillRouteArgs(key: key, userResumeId: userResumeId),
         initialChildren: children,
       );

  static const String name = 'SkillRoute';

  static _i29.PageInfo page = _i29.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SkillRouteArgs>();
      return _i25.SkillScreen(key: args.key, userResumeId: args.userResumeId);
    },
  );
}

class SkillRouteArgs {
  const SkillRouteArgs({this.key, required this.userResumeId});

  final _i30.Key? key;

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
/// [_i26.SplashScreen]
class SplashRoute extends _i29.PageRouteInfo<void> {
  const SplashRoute({List<_i29.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i29.PageInfo page = _i29.PageInfo(
    name,
    builder: (data) {
      return const _i26.SplashScreen();
    },
  );
}

/// generated route for
/// [_i27.WorkExperienceDetailScreen]
class WorkExperienceDetailRoute extends _i29.PageRouteInfo<void> {
  const WorkExperienceDetailRoute({List<_i29.PageRouteInfo>? children})
    : super(WorkExperienceDetailRoute.name, initialChildren: children);

  static const String name = 'WorkExperienceDetailRoute';

  static _i29.PageInfo page = _i29.PageInfo(
    name,
    builder: (data) {
      return const _i27.WorkExperienceDetailScreen();
    },
  );
}

/// generated route for
/// [_i28.WorkExperienceScreen]
class WorkExperienceRoute extends _i29.PageRouteInfo<void> {
  const WorkExperienceRoute({List<_i29.PageRouteInfo>? children})
    : super(WorkExperienceRoute.name, initialChildren: children);

  static const String name = 'WorkExperienceRoute';

  static _i29.PageInfo page = _i29.PageInfo(
    name,
    builder: (data) {
      return const _i28.WorkExperienceScreen();
    },
  );
}
