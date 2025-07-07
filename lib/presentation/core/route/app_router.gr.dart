// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:career_coach/presentation/screen/auth/login/login_screen.dart'
    as _i4;
import 'package:career_coach/presentation/screen/auth/register/register_screen.dart'
    as _i7;
import 'package:career_coach/presentation/screen/over_view/home/home_screen.dart'
    as _i1;
import 'package:career_coach/presentation/screen/over_view/list_cv_and_cl/list_cv_and_cl_screen.dart'
    as _i2;
import 'package:career_coach/presentation/screen/over_view/list_interview/list_interview_screen.dart'
    as _i3;
import 'package:career_coach/presentation/screen/over_view/over_view_screen.dart'
    as _i5;
import 'package:career_coach/presentation/screen/over_view/profile/profile_screen.dart'
    as _i6;
import 'package:flutter/material.dart' as _i9;

/// generated route for
/// [_i1.HomeScreen]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute({List<_i8.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i1.HomeScreen();
    },
  );
}

/// generated route for
/// [_i2.ListCvAndClScreen]
class ListCvAndClRoute extends _i8.PageRouteInfo<void> {
  const ListCvAndClRoute({List<_i8.PageRouteInfo>? children})
    : super(ListCvAndClRoute.name, initialChildren: children);

  static const String name = 'ListCvAndClRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i2.ListCvAndClScreen();
    },
  );
}

/// generated route for
/// [_i3.ListInterviewScreen]
class ListInterviewRoute extends _i8.PageRouteInfo<ListInterviewRouteArgs> {
  ListInterviewRoute({_i9.Key? key, List<_i8.PageRouteInfo>? children})
    : super(
        ListInterviewRoute.name,
        args: ListInterviewRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'ListInterviewRoute';

  static _i8.PageInfo page = _i8.PageInfo(
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

  final _i9.Key? key;

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
class LoginRoute extends _i8.PageRouteInfo<void> {
  const LoginRoute({List<_i8.PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i4.LoginScreen();
    },
  );
}

/// generated route for
/// [_i5.OverViewScreen]
class OverViewRoute extends _i8.PageRouteInfo<void> {
  const OverViewRoute({List<_i8.PageRouteInfo>? children})
    : super(OverViewRoute.name, initialChildren: children);

  static const String name = 'OverViewRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i5.OverViewScreen();
    },
  );
}

/// generated route for
/// [_i6.ProfileScreen]
class ProfileRoute extends _i8.PageRouteInfo<void> {
  const ProfileRoute({List<_i8.PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i6.ProfileScreen();
    },
  );
}

/// generated route for
/// [_i7.RegisterScreen]
class RegisterRoute extends _i8.PageRouteInfo<void> {
  const RegisterRoute({List<_i8.PageRouteInfo>? children})
    : super(RegisterRoute.name, initialChildren: children);

  static const String name = 'RegisterRoute';

  static _i8.PageInfo page = _i8.PageInfo(
    name,
    builder: (data) {
      return const _i7.RegisterScreen();
    },
  );
}
