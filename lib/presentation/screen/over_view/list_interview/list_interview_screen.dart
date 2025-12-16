import 'package:auto_route/auto_route.dart';
import 'package:career_coach/presentation/core/extension/ext_context.dart';
import 'package:career_coach/presentation/core/utils/text_style_utils.dart';
import 'package:career_coach/presentation/core/widgets/base_search_bar.dart';
import 'package:career_coach/presentation/screen/over_view/list_interview/cubit/list_interview_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconly/iconly.dart';

@RoutePage()
class ListInterviewScreen extends StatelessWidget {
  const ListInterviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => ListInterviewCubit()..init(), child: ListInterviewScreenUI());
  }
}

class ListInterviewScreenUI extends StatelessWidget {
  ListInterviewScreenUI({super.key});

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        color: context.theme.backgroundColor,
        child: Column(
          children: [
            _searchBar(context),
            Expanded(child: _listInterview()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {

        },
        backgroundColor: context.theme.primaryColor,
        child: Icon(FontAwesomeIcons.twitch, color: context.theme.backgroundColor),
      ),
    );
  }

  Widget _searchBar(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 8),
        Expanded(child: BaseSearchBar(controller: _searchController)),
        PopupMenuButton(
          icon: Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(color: context.theme.primaryColor, borderRadius: BorderRadius.circular(100)),
            child: Icon(IconlyLight.filter, color: context.theme.backgroundColor),
          ),
          itemBuilder: (BuildContext context) {
            return [PopupMenuItem(value: 1, child: Text("Gần đây")), PopupMenuItem(value: 2, child: Text("Cũ hơn"))];
          },
        ),
      ],
    );
  }

  Widget _listInterview() {
    return BlocConsumer<ListInterviewCubit, ListInterviewState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return ListView.separated(
          padding: EdgeInsets.all(8),
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("11:30 01/01/2024", style: TextStyleUtils.normal(color: context.theme.textColor)),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                  decoration: BoxDecoration(
                    color: index % 3 == 0
                        ? context.theme.goodColor.withAlpha((255 * 0.1).round())
                        : index % 3 == 1
                        ? context.theme.mediumColor.withAlpha((255 * 0.1).round())
                        : context.theme.badColor.withAlpha((255 * 0.1).round()),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    index % 3 == 0
                        ? context.language.good
                        : index % 3 == 1
                        ? context.language.medium
                        : context.language.bad,
                    style: TextStyleUtils.bold(
                      fontSize: 12,
                      color: index % 3 == 0
                          ? context.theme.goodColor
                          : index % 3 == 1
                          ? context.theme.mediumColor
                          : context.theme.badColor,
                    ),
                  ),
                ),
              ],
            );
          },
          separatorBuilder: (context, index) =>
              Container(height: 1, margin: EdgeInsets.symmetric(vertical: 8), color: context.theme.borderColor),
          itemCount: 15,
        );
      },
    );
  }
}
