import 'package:auto_route/auto_route.dart';
import 'package:career_coach/presentation/core/extension/ext_context.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

@RoutePage()
class ListCvAndClScreen extends StatefulWidget {
  const ListCvAndClScreen({super.key});

  @override
  State<ListCvAndClScreen> createState() => _ListCvAndClScreenState();
}

class _ListCvAndClScreenState extends State<ListCvAndClScreen> with SingleTickerProviderStateMixin{
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _tabBar(),
          const SizedBox(height: 8),
          _tabBarView()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle add new interview action
        },
        backgroundColor: context.theme.primaryColor,
        child: Icon(
          FontAwesomeIcons.twitch,
          color: context.theme.backgroundColor,
        ),
      ),
    );
  }

  Widget _tabBar() {
    return TabBar(
      controller: tabController,
      dividerColor: Colors.transparent,
      indicatorColor: context.theme.primaryColor,
      labelColor: context.theme.primaryColor,
      unselectedLabelColor: context.theme.borderColor,
      tabs: [
        Tab(
          text: context.language.cv,
        ),
        Tab(
          text: context.language.cl,
        ),
      ],
    );
  }

  Widget _tabBarView() {
    return Container(
      height: 200,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: TabBarView(
          controller: tabController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  width: 100,
                  color: context.theme.primaryColor,
                );
              },
              separatorBuilder: (_, __) => SizedBox(width: 8),
              itemCount: 10,
            ),
            ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  width: 100,
                  color: context.theme.primaryColor,
                );
              },
              separatorBuilder: (_, __) => SizedBox(width: 8),
              itemCount: 10,
            ),
          ]
      ),
    );
  }
}
