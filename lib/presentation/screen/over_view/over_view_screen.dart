import 'package:auto_route/auto_route.dart';
import 'package:career_coach/presentation/core/extension/ext_context.dart';
import 'package:career_coach/presentation/core/route/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

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
          body: Padding(
            padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
            child: child,
          ),
          bottomNavigationBar: SalomonBottomBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: (index) => tabsRouter.setActiveIndex(index),
            backgroundColor: context.theme.backgroundColor,
            items: [
              SalomonBottomBarItem(
                icon: Icon(IconlyLight.home),
                activeIcon: Icon(IconlyBold.home),
                selectedColor: context.theme.primaryColor,
                title: Text(context.language.home),
              ),
              SalomonBottomBarItem(
                icon: Icon(IconlyLight.document),
                activeIcon: Icon(IconlyBold.document),
                selectedColor: context.theme.primaryColor,
                title: Text(context.language.cvAndCl_2),
              ),
              SalomonBottomBarItem(
                icon: Icon(IconlyLight.chat),
                activeIcon: Icon(IconlyBold.chat),
                selectedColor: context.theme.primaryColor,
                title: Text(context.language.chatBot),
              ),
              SalomonBottomBarItem(
                icon: Icon(IconlyLight.profile),
                activeIcon: Icon(IconlyBold.profile),
                selectedColor: context.theme.primaryColor,
                title: Text(context.language.profile),
              ),
            ],
          ),
        );
      },
    );
  }
}
