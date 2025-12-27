// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i25;
import 'package:career_coach/domain/entity/user_entity.dart' as _i29;
import 'package:career_coach/domain/entity/user_resume_entity.dart' as _i27;
import 'package:career_coach/domain/enum/type_interview_status_enum.dart'
    as _i28;
import 'package:career_coach/presentation/screen/auth/login/login_screen.dart'
    as _i12;
import 'package:career_coach/presentation/screen/auth/register/register_screen.dart'
    as _i21;
import 'package:career_coach/presentation/screen/layout_resume/layout_resume_screen.dart'
    as _i10;
import 'package:career_coach/presentation/screen/manage_user_resume/manage_user_resume_screen.dart'
    as _i13;
import 'package:career_coach/presentation/screen/message/message_screen.dart'
    as _i14;
import 'package:career_coach/presentation/screen/over_view/home/home_screen.dart'
    as _i9;
import 'package:career_coach/presentation/screen/over_view/list_interview/list_interview_screen.dart'
    as _i11;
import 'package:career_coach/presentation/screen/over_view/over_view_screen.dart'
    as _i16;
import 'package:career_coach/presentation/screen/over_view/profile/profile_screen.dart'
    as _i18;
import 'package:career_coach/presentation/screen/preview_resume/preview_resume_screen.dart'
    as _i17;
import 'package:career_coach/presentation/screen/profile_update/profile_update_screen.dart'
    as _i19;
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
    as _i15;
import 'package:career_coach/presentation/screen/section_resume/project/project_screen.dart'
    as _i20;
import 'package:career_coach/presentation/screen/section_resume/skill/skill_screen.dart'
    as _i22;
import 'package:career_coach/presentation/screen/section_resume/work_experience/work_experience_screen.dart'
    as _i24;
import 'package:career_coach/presentation/screen/splash/splash_screen.dart'
    as _i23;
import 'package:flutter/material.dart' as _i26;

/// generated route for
/// [_i1.ActivityScreen]
class ActivityRoute extends _i25.PageRouteInfo<ActivityRouteArgs> {
  ActivityRoute({
    _i26.Key? key,
    required int userResumeId,
    List<_i25.PageRouteInfo>? children,
  }) : super(
         ActivityRoute.name,
         args: ActivityRouteArgs(key: key, userResumeId: userResumeId),
         initialChildren: children,
       );

  static const String name = 'ActivityRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ActivityRouteArgs>();
      return _i1.ActivityScreen(key: args.key, userResumeId: args.userResumeId);
    },
  );
}

class ActivityRouteArgs {
  const ActivityRouteArgs({this.key, required this.userResumeId});

  final _i26.Key? key;

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
class AvatarRoute extends _i25.PageRouteInfo<AvatarRouteArgs> {
  AvatarRoute({
    _i26.Key? key,
    required int userResumeId,
    List<_i25.PageRouteInfo>? children,
  }) : super(
         AvatarRoute.name,
         args: AvatarRouteArgs(key: key, userResumeId: userResumeId),
         initialChildren: children,
       );

  static const String name = 'AvatarRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AvatarRouteArgs>();
      return _i2.AvatarScreen(key: args.key, userResumeId: args.userResumeId);
    },
  );
}

class AvatarRouteArgs {
  const AvatarRouteArgs({this.key, required this.userResumeId});

  final _i26.Key? key;

  final int userResumeId;

  @override
  String toString() {
    return 'AvatarRouteArgs{key: $key, userResumeId: $userResumeId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! AvatarRouteArgs) return false;
    return key == other.key && userResumeId == other.userResumeId;
  }

  @override
  int get hashCode => key.hashCode ^ userResumeId.hashCode;
}

/// generated route for
/// [_i3.AwardScreen]
class AwardRoute extends _i25.PageRouteInfo<AwardRouteArgs> {
  AwardRoute({
    _i26.Key? key,
    required int userResumeId,
    List<_i25.PageRouteInfo>? children,
  }) : super(
         AwardRoute.name,
         args: AwardRouteArgs(key: key, userResumeId: userResumeId),
         initialChildren: children,
       );

  static const String name = 'AwardRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AwardRouteArgs>();
      return _i3.AwardScreen(key: args.key, userResumeId: args.userResumeId);
    },
  );
}

class AwardRouteArgs {
  const AwardRouteArgs({this.key, required this.userResumeId});

  final _i26.Key? key;

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
class CertificateRoute extends _i25.PageRouteInfo<CertificateRouteArgs> {
  CertificateRoute({
    _i26.Key? key,
    required int userResumeId,
    List<_i25.PageRouteInfo>? children,
  }) : super(
         CertificateRoute.name,
         args: CertificateRouteArgs(key: key, userResumeId: userResumeId),
         initialChildren: children,
       );

  static const String name = 'CertificateRoute';

  static _i25.PageInfo page = _i25.PageInfo(
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

  final _i26.Key? key;

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
    extends _i25.PageRouteInfo<ContactInformationRouteArgs> {
  ContactInformationRoute({
    _i26.Key? key,
    required int userResumeId,
    List<_i25.PageRouteInfo>? children,
  }) : super(
         ContactInformationRoute.name,
         args: ContactInformationRouteArgs(
           key: key,
           userResumeId: userResumeId,
         ),
         initialChildren: children,
       );

  static const String name = 'ContactInformationRoute';

  static _i25.PageInfo page = _i25.PageInfo(
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

  final _i26.Key? key;

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
class EducationRoute extends _i25.PageRouteInfo<EducationRouteArgs> {
  EducationRoute({
    _i26.Key? key,
    required int userResumeId,
    List<_i25.PageRouteInfo>? children,
  }) : super(
         EducationRoute.name,
         args: EducationRouteArgs(key: key, userResumeId: userResumeId),
         initialChildren: children,
       );

  static const String name = 'EducationRoute';

  static _i25.PageInfo page = _i25.PageInfo(
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

  final _i26.Key? key;

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
class FavoriteRoute extends _i25.PageRouteInfo<FavoriteRouteArgs> {
  FavoriteRoute({
    _i26.Key? key,
    required int userResumeId,
    List<_i25.PageRouteInfo>? children,
  }) : super(
         FavoriteRoute.name,
         args: FavoriteRouteArgs(key: key, userResumeId: userResumeId),
         initialChildren: children,
       );

  static const String name = 'FavoriteRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FavoriteRouteArgs>();
      return _i7.FavoriteScreen(key: args.key, userResumeId: args.userResumeId);
    },
  );
}

class FavoriteRouteArgs {
  const FavoriteRouteArgs({this.key, required this.userResumeId});

  final _i26.Key? key;

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
class GoalRoute extends _i25.PageRouteInfo<GoalRouteArgs> {
  GoalRoute({
    _i26.Key? key,
    required int userResumeId,
    List<_i25.PageRouteInfo>? children,
  }) : super(
         GoalRoute.name,
         args: GoalRouteArgs(key: key, userResumeId: userResumeId),
         initialChildren: children,
       );

  static const String name = 'GoalRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<GoalRouteArgs>();
      return _i8.GoalScreen(key: args.key, userResumeId: args.userResumeId);
    },
  );
}

class GoalRouteArgs {
  const GoalRouteArgs({this.key, required this.userResumeId});

  final _i26.Key? key;

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
class HomeRoute extends _i25.PageRouteInfo<void> {
  const HomeRoute({List<_i25.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      return const _i9.HomeScreen();
    },
  );
}

/// generated route for
/// [_i10.LayoutResumeScreen]
class LayoutResumeRoute extends _i25.PageRouteInfo<LayoutResumeRouteArgs> {
  LayoutResumeRoute({
    _i26.Key? key,
    required _i27.UserResumeEntity userResumeEntity,
    List<_i25.PageRouteInfo>? children,
  }) : super(
         LayoutResumeRoute.name,
         args: LayoutResumeRouteArgs(
           key: key,
           userResumeEntity: userResumeEntity,
         ),
         initialChildren: children,
       );

  static const String name = 'LayoutResumeRoute';

  static _i25.PageInfo page = _i25.PageInfo(
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

  final _i26.Key? key;

  final _i27.UserResumeEntity userResumeEntity;

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
class ListInterviewRoute extends _i25.PageRouteInfo<void> {
  const ListInterviewRoute({List<_i25.PageRouteInfo>? children})
    : super(ListInterviewRoute.name, initialChildren: children);

  static const String name = 'ListInterviewRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      return const _i11.ListInterviewScreen();
    },
  );
}

/// generated route for
/// [_i12.LoginScreen]
class LoginRoute extends _i25.PageRouteInfo<void> {
  const LoginRoute({List<_i25.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      return const _i12.LoginScreen();
    },
  );
}

/// generated route for
/// [_i13.ManageUserResumeScreen]
class ManageUserResumeRoute extends _i25.PageRouteInfo<void> {
  const ManageUserResumeRoute({List<_i25.PageRouteInfo>? children})
    : super(ManageUserResumeRoute.name, initialChildren: children);

  static const String name = 'ManageUserResumeRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      return const _i13.ManageUserResumeScreen();
    },
  );
}

/// generated route for
/// [_i14.MessageScreen]
class MessageRoute extends _i25.PageRouteInfo<MessageRouteArgs> {
  MessageRoute({
    _i26.Key? key,
    required int sessionId,
    required _i28.TypeInterviewStatusEnum status,
    List<_i25.PageRouteInfo>? children,
  }) : super(
         MessageRoute.name,
         args: MessageRouteArgs(key: key, sessionId: sessionId, status: status),
         initialChildren: children,
       );

  static const String name = 'MessageRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MessageRouteArgs>();
      return _i14.MessageScreen(
        key: args.key,
        sessionId: args.sessionId,
        status: args.status,
      );
    },
  );
}

class MessageRouteArgs {
  const MessageRouteArgs({
    this.key,
    required this.sessionId,
    required this.status,
  });

  final _i26.Key? key;

  final int sessionId;

  final _i28.TypeInterviewStatusEnum status;

  @override
  String toString() {
    return 'MessageRouteArgs{key: $key, sessionId: $sessionId, status: $status}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! MessageRouteArgs) return false;
    return key == other.key &&
        sessionId == other.sessionId &&
        status == other.status;
  }

  @override
  int get hashCode => key.hashCode ^ sessionId.hashCode ^ status.hashCode;
}

/// generated route for
/// [_i15.OtherInformationScreen]
class OtherInformationRoute
    extends _i25.PageRouteInfo<OtherInformationRouteArgs> {
  OtherInformationRoute({
    _i26.Key? key,
    required int userResumeId,
    List<_i25.PageRouteInfo>? children,
  }) : super(
         OtherInformationRoute.name,
         args: OtherInformationRouteArgs(key: key, userResumeId: userResumeId),
         initialChildren: children,
       );

  static const String name = 'OtherInformationRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OtherInformationRouteArgs>();
      return _i15.OtherInformationScreen(
        key: args.key,
        userResumeId: args.userResumeId,
      );
    },
  );
}

class OtherInformationRouteArgs {
  const OtherInformationRouteArgs({this.key, required this.userResumeId});

  final _i26.Key? key;

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
/// [_i16.OverViewScreen]
class OverViewRoute extends _i25.PageRouteInfo<void> {
  const OverViewRoute({List<_i25.PageRouteInfo>? children})
    : super(OverViewRoute.name, initialChildren: children);

  static const String name = 'OverViewRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      return const _i16.OverViewScreen();
    },
  );
}

/// generated route for
/// [_i17.PreviewResumeScreen]
class PreviewResumeRoute extends _i25.PageRouteInfo<PreviewResumeRouteArgs> {
  PreviewResumeRoute({
    _i26.Key? key,
    int? resumeId,
    int? userResumeId,
    required bool isCreateNew,
    required bool isCreateWithAI,
    String content = '',
    int? sourceUserResumeId,
    List<_i25.PageRouteInfo>? children,
  }) : super(
         PreviewResumeRoute.name,
         args: PreviewResumeRouteArgs(
           key: key,
           resumeId: resumeId,
           userResumeId: userResumeId,
           isCreateNew: isCreateNew,
           isCreateWithAI: isCreateWithAI,
           content: content,
           sourceUserResumeId: sourceUserResumeId,
         ),
         initialChildren: children,
       );

  static const String name = 'PreviewResumeRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PreviewResumeRouteArgs>();
      return _i17.PreviewResumeScreen(
        key: args.key,
        resumeId: args.resumeId,
        userResumeId: args.userResumeId,
        isCreateNew: args.isCreateNew,
        isCreateWithAI: args.isCreateWithAI,
        content: args.content,
        sourceUserResumeId: args.sourceUserResumeId,
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
    required this.isCreateWithAI,
    this.content = '',
    this.sourceUserResumeId,
  });

  final _i26.Key? key;

  final int? resumeId;

  final int? userResumeId;

  final bool isCreateNew;

  final bool isCreateWithAI;

  final String content;

  final int? sourceUserResumeId;

  @override
  String toString() {
    return 'PreviewResumeRouteArgs{key: $key, resumeId: $resumeId, userResumeId: $userResumeId, isCreateNew: $isCreateNew, isCreateWithAI: $isCreateWithAI, content: $content, sourceUserResumeId: $sourceUserResumeId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! PreviewResumeRouteArgs) return false;
    return key == other.key &&
        resumeId == other.resumeId &&
        userResumeId == other.userResumeId &&
        isCreateNew == other.isCreateNew &&
        isCreateWithAI == other.isCreateWithAI &&
        content == other.content &&
        sourceUserResumeId == other.sourceUserResumeId;
  }

  @override
  int get hashCode =>
      key.hashCode ^
      resumeId.hashCode ^
      userResumeId.hashCode ^
      isCreateNew.hashCode ^
      isCreateWithAI.hashCode ^
      content.hashCode ^
      sourceUserResumeId.hashCode;
}

/// generated route for
/// [_i18.ProfileScreen]
class ProfileRoute extends _i25.PageRouteInfo<void> {
  const ProfileRoute({List<_i25.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      return const _i18.ProfileScreen();
    },
  );
}

/// generated route for
/// [_i19.ProfileUpdateScreen]
class ProfileUpdateRoute extends _i25.PageRouteInfo<ProfileUpdateRouteArgs> {
  ProfileUpdateRoute({
    _i26.Key? key,
    required _i29.UserEntity userEntity,
    List<_i25.PageRouteInfo>? children,
  }) : super(
         ProfileUpdateRoute.name,
         args: ProfileUpdateRouteArgs(key: key, userEntity: userEntity),
         initialChildren: children,
       );

  static const String name = 'ProfileUpdateRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProfileUpdateRouteArgs>();
      return _i19.ProfileUpdateScreen(
        key: args.key,
        userEntity: args.userEntity,
      );
    },
  );
}

class ProfileUpdateRouteArgs {
  const ProfileUpdateRouteArgs({this.key, required this.userEntity});

  final _i26.Key? key;

  final _i29.UserEntity userEntity;

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
/// [_i20.ProjectScreen]
class ProjectRoute extends _i25.PageRouteInfo<ProjectRouteArgs> {
  ProjectRoute({
    _i26.Key? key,
    required int userResumeId,
    List<_i25.PageRouteInfo>? children,
  }) : super(
         ProjectRoute.name,
         args: ProjectRouteArgs(key: key, userResumeId: userResumeId),
         initialChildren: children,
       );

  static const String name = 'ProjectRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProjectRouteArgs>();
      return _i20.ProjectScreen(key: args.key, userResumeId: args.userResumeId);
    },
  );
}

class ProjectRouteArgs {
  const ProjectRouteArgs({this.key, required this.userResumeId});

  final _i26.Key? key;

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
/// [_i21.RegisterScreen]
class RegisterRoute extends _i25.PageRouteInfo<void> {
  const RegisterRoute({List<_i25.PageRouteInfo>? children})
    : super(RegisterRoute.name, initialChildren: children);

  static const String name = 'RegisterRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      return const _i21.RegisterScreen();
    },
  );
}

/// generated route for
/// [_i22.SkillScreen]
class SkillRoute extends _i25.PageRouteInfo<SkillRouteArgs> {
  SkillRoute({
    _i26.Key? key,
    required int userResumeId,
    List<_i25.PageRouteInfo>? children,
  }) : super(
         SkillRoute.name,
         args: SkillRouteArgs(key: key, userResumeId: userResumeId),
         initialChildren: children,
       );

  static const String name = 'SkillRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SkillRouteArgs>();
      return _i22.SkillScreen(key: args.key, userResumeId: args.userResumeId);
    },
  );
}

class SkillRouteArgs {
  const SkillRouteArgs({this.key, required this.userResumeId});

  final _i26.Key? key;

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
/// [_i23.SplashScreen]
class SplashRoute extends _i25.PageRouteInfo<void> {
  const SplashRoute({List<_i25.PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      return const _i23.SplashScreen();
    },
  );
}

/// generated route for
/// [_i24.WorkExperienceScreen]
class WorkExperienceRoute extends _i25.PageRouteInfo<WorkExperienceRouteArgs> {
  WorkExperienceRoute({
    _i26.Key? key,
    required int userResumeId,
    List<_i25.PageRouteInfo>? children,
  }) : super(
         WorkExperienceRoute.name,
         args: WorkExperienceRouteArgs(key: key, userResumeId: userResumeId),
         initialChildren: children,
       );

  static const String name = 'WorkExperienceRoute';

  static _i25.PageInfo page = _i25.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<WorkExperienceRouteArgs>();
      return _i24.WorkExperienceScreen(
        key: args.key,
        userResumeId: args.userResumeId,
      );
    },
  );
}

class WorkExperienceRouteArgs {
  const WorkExperienceRouteArgs({this.key, required this.userResumeId});

  final _i26.Key? key;

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
