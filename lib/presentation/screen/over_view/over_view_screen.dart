import 'package:auto_route/auto_route.dart';
import 'package:career_coach/presentation/core/extension/ext_context.dart';
import 'package:career_coach/presentation/core/route/app_router.gr.dart';
import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

@RoutePage()
class OverViewScreen extends StatefulWidget {
  const OverViewScreen({super.key});

  @override
  State<OverViewScreen> createState() => _OverViewScreenState();
}

class _OverViewScreenState extends State<OverViewScreen> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        HomeRoute(),
        ListCvAndClRoute(),
        ListInterviewRoute(),
        ProfileRoute(),
      ],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);

        return Scaffold(
          body: child,
          bottomNavigationBar: CrystalNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: (index) => tabsRouter.setActiveIndex(index),
            marginR: EdgeInsets.symmetric(vertical: 16, horizontal: 64),
            paddingR: EdgeInsets.symmetric(vertical: 0),
            backgroundColor: context.theme.textColor.withAlpha((255 * 0.1).round()),
            items: [
              CrystalNavigationBarItem(
                icon: IconlyBold.home,
                unselectedIcon: IconlyLight.home,
                selectedColor: context.theme.primaryColor,
              ),
              CrystalNavigationBarItem(
                icon: IconlyBold.paper,
                unselectedIcon: IconlyLight.paper,
                selectedColor: context.theme.primaryColor,
              ),
              CrystalNavigationBarItem(
                icon: IconlyBold.chat,
                unselectedIcon: IconlyLight.chat,
                selectedColor: context.theme.primaryColor,
              ),
              CrystalNavigationBarItem(
                icon: IconlyBold.profile,
                unselectedIcon: IconlyLight.profile,
                selectedColor: context.theme.primaryColor,
              ),
            ],
          ),
        );
      },
    );
  }
}
