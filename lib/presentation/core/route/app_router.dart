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
        AutoRoute(page: ListInterviewRoute.page),
        AutoRoute(page: ProfileRoute.page),
      ],
    ),
    AutoRoute(page: ProfileUpdateRoute.page),
    AutoRoute(page: ManageUserResumeRoute.page),
    AutoRoute(page: PreviewResumeRoute.page),
    AutoRoute(page: LayoutResumeRoute.page),
    AutoRoute(page: ContactInformationRoute.page),
    AutoRoute(page: AvatarRoute.page),
    AutoRoute(page: WorkExperienceRoute.page),
    AutoRoute(page: WorkExperienceDetailRoute.page),
    AutoRoute(page: ProjectRoute.page),
    AutoRoute(page: ProjectDetailRoute.page),
    AutoRoute(page: ActivityRoute.page),
    AutoRoute(page: AwardRoute.page),
    AutoRoute(page: AwardDetailRoute.page),
    AutoRoute(page: CertificateRoute.page),
    AutoRoute(page: EducationRoute.page),
    AutoRoute(page: EducationDetailRoute.page),
    AutoRoute(page: FavoriteRoute.page),
    AutoRoute(page: FavoriteDetailRoute.page),
    AutoRoute(page: GoalRoute.page),
    AutoRoute(page: SkillRoute.page),
    AutoRoute(page: OtherInformationRoute.page),
  ];
}