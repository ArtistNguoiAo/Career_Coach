import 'package:auto_route/auto_route.dart';
import 'package:career_coach/presentation/core/extension/ext_context.dart';
import 'package:career_coach/presentation/core/utils/text_style_utils.dart';
import 'package:career_coach/presentation/screen/over_view/home/view/header_view.dart';
import 'package:career_coach/presentation/screen/over_view/home/view/title_view.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this); // 3 tab
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderView(),
            const SizedBox(height: 16),
            _cvAndCl(),
            const SizedBox(height: 16),
            _outstanding(),
            const SizedBox(height: 16),
            _tool(),
            const SizedBox(height: 16),
          ],
        ),
      )
    );
  }

  Widget _cvAndCl() {
    return Column(
      children: [
        TitleView(title: context.language.cvAndCl),
        TabBar(
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
        ),
        const SizedBox(height: 8),
        Container(
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
        ),
      ],
    );
  }

  Widget _outstanding() {
    return Column(
      children: [
        TitleView(title: context.language.outstanding),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CarouselSlider(
            options: CarouselOptions(
              height: 150,
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 0.7,
              onPageChanged: (index, reason) {
                },
            ),
            items: [
              Container(
                width: double.infinity,
                color: context.theme.primaryColor,
              ),
              Container(
                width: double.infinity,
                color: context.theme.primaryColor,
              ),
              Container(
                width: double.infinity,
                color: context.theme.primaryColor,
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _tool() {
    return Column(
      children: [
        TitleView(title: context.language.tool),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(8),
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: context.theme.backgroundColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: context.theme.textColor.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: context.theme.primaryColor,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Icon(
                  FontAwesomeIcons.calculator,
                  color: context.theme.backgroundColor,
                  size: 20,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  context.language.calculateGrossNetSalary,
                  style: TextStyleUtils.normal(
                    color: context.theme.textColor,
                    fontSize: 16,
                  )
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                FontAwesomeIcons.anglesRight,
                color: context.theme.textColor,
                size: 20,
              ),
            ],
          ),
        )
      ],
    );
  }
}
