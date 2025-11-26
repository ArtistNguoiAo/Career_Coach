import 'package:auto_route/auto_route.dart';
import 'package:career_coach/domain/entity/user_resume_entity.dart';
import 'package:career_coach/domain/enum/type_resume_section_enum.dart';
import 'package:career_coach/presentation/core/extension/ext_context.dart';
import 'package:career_coach/presentation/core/utils/text_style_utils.dart';
import 'package:drag_and_drop_lists/drag_and_drop_lists.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

@RoutePage()
class StructureResumeScreen extends StatefulWidget {
  const StructureResumeScreen({super.key, required this.userResumeEntity});

  final UserResumeEntity userResumeEntity;

  @override
  State<StructureResumeScreen> createState() => _StructureResumeScreenState();
}

class _StructureResumeScreenState extends State<StructureResumeScreen> {
  List<TypeResumeSectionEnum> usedSections = [];
  List<TypeResumeSectionEnum> leftUsedSections = [];
  List<TypeResumeSectionEnum> rightUsedSections = [];
  List<TypeResumeSectionEnum> unusedSections = [];

  @override
  void initState() {
    super.initState();

    if (widget.userResumeEntity.numberOfColumns == 1) {
      usedSections = [...widget.userResumeEntity.layouts.first.sections];
    } else if (widget.userResumeEntity.numberOfColumns == 2) {
      leftUsedSections = [...widget.userResumeEntity.layouts[0].sections];
      rightUsedSections = [...widget.userResumeEntity.layouts[1].sections];
      usedSections = [...leftUsedSections, ...rightUsedSections];
    }

    unusedSections = TypeResumeSectionEnum.values.where((e) => !usedSections.contains(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => AutoRouter.of(context).maybePop(),
          child: Icon(FontAwesomeIcons.chevronLeft, color: context.theme.backgroundColor, size: 20),
        ),
        centerTitle: true,
        title: Text(
          context.language.editContent,
          style: TextStyleUtils.bold(color: context.theme.backgroundColor, fontSize: 18),
        ),
        backgroundColor: context.theme.primaryColor,
      ),
      body: Container(
        color: context.theme.backgroundColor,
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Expanded(child: _body()),
            const SizedBox(height: 8),
            _buttonSave(),
          ],
        ),
      ),
    );
  }

  Widget _body() {
    if (widget.userResumeEntity.numberOfColumns == 1) {
      return _oneColumnBody();
    } else {
      return _twoColumnBody();
    }
  }

  Widget _oneColumnBody() {
    return Column(
      children: [
        Expanded(
          child: DragAndDropLists(
            children: [
              DragAndDropList(
                children: usedSections
                    .map((e) => DragAndDropItem(child: _sectionItem(title: e.name)))
                    .toList(),
              ),
            ],
            onItemReorder: (oldItemIndex, oldListIndex, newItemIndex, newListIndex) {
              setState(() {
                if (oldListIndex == newListIndex) {
                  final item = usedSections.removeAt(oldItemIndex);
                  usedSections.insert(newItemIndex, item);
                }
              });
            },
            onListReorder: (oldListIndex, newListIndex) {},
          ),
        ),

        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: unusedSections
              .map((e) => _sectionItem(title: e.name))
              .toList(),
        )
      ],
    );
  }


  Widget _twoColumnBody() {
    return DragAndDropLists(
      axis: Axis.horizontal,
      children: [
        DragAndDropList(
          children: leftUsedSections
              .map((e) => DragAndDropItem(child: _sectionItem(title: e.name)))
              .toList(),
        ),
        DragAndDropList(
          children: rightUsedSections
              .map((e) => DragAndDropItem(child: _sectionItem(title: e.name)))
              .toList(),
        ),
      ],
      onItemReorder: (oldItemIndex, oldListIndex, newItemIndex, newListIndex) {
        setState(() {
          final item = leftUsedSections.removeAt(oldItemIndex);
          leftUsedSections.insert(newItemIndex, item);
        });
      },
      onListReorder: (oldListIndex, newListIndex) {},
    );
  }

  Widget _sectionItem({required String title}) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(color: context.theme.lightGreyColor, borderRadius: BorderRadius.circular(4)),
      child: Row(
        children: [
          Icon(FontAwesomeIcons.mapPin, size: 16, color: context.theme.darkGreyColor),
          const SizedBox(width: 8),
          Flexible(
            child: Text(
              title,
              style: TextStyleUtils.normal(color: context.theme.textColor, fontSize: 14),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buttonSave() {
    return InkWell(
      onTap: () {},
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(color: context.theme.primaryColor, borderRadius: BorderRadius.circular(4)),
        child: Text(
          context.language.save,
          textAlign: TextAlign.center,
          style: TextStyleUtils.bold(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
