import 'package:auto_route/auto_route.dart';
import 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(page: LoginRoute.page),
    AutoRoute(page: RegisterRoute.page),
    AutoRoute(
      page: OverViewRoute.page,
      children: [
        AutoRoute(page: HomeRoute.page, initial: true),
        AutoRoute(page: ListCvAndClRoute.page),
        AutoRoute(page: ListInterviewRoute.page),
        AutoRoute(page: ProfileRoute.page),
      ],
    ),
    AutoRoute(page: ProfileUpdateRoute.page),
    AutoRoute(page: PreviewResumeRoute.page),
    AutoRoute(page: StructureResumeRoute.page),
    AutoRoute(page: ContactInformationRoute.page),
    AutoRoute(page: AvatarRoute.page),
    AutoRoute(page: WorkExperienceRoute.page),
    AutoRoute(page: WorkExperienceDetailRoute.page),
  ];
}