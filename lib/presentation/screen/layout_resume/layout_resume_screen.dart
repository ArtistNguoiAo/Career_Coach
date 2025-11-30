import 'package:auto_route/auto_route.dart';
import 'package:career_coach/domain/entity/user_resume_entity.dart';
import 'package:career_coach/domain/enum/type_resume_section_enum.dart';
import 'package:career_coach/presentation/core/extension/ext_context.dart';
import 'package:career_coach/presentation/core/utils/string_utils.dart';
import 'package:career_coach/presentation/core/utils/text_style_utils.dart';
import 'package:career_coach/presentation/screen/layout_resume/widgets/width_percentage_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

@RoutePage()
class LayoutResumeScreen extends StatefulWidget {
  const LayoutResumeScreen({super.key, required this.userResumeEntity});

  final UserResumeEntity userResumeEntity;

  @override
  State<LayoutResumeScreen> createState() => _LayoutResumeScreenState();
}

class _LayoutResumeScreenState extends State<LayoutResumeScreen> {
  List<TypeResumeSectionEnum> usedSections = [];
  List<TypeResumeSectionEnum> leftUsedSections = [];
  List<TypeResumeSectionEnum> rightUsedSections = [];
  List<TypeResumeSectionEnum> unusedSections = [];
  final ValueNotifier<_HoverInfo?> hoverNotifier = ValueNotifier(null);

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

  List<List<TypeResumeSectionEnum>> get activeLists {
    return widget.userResumeEntity.numberOfColumns == 1
        ? [usedSections, unusedSections]
        : [leftUsedSections, rightUsedSections, unusedSections];
  }

  void removeItem(TypeResumeSectionEnum item) {
    for (var list in activeLists) {
      list.remove(item);
    }
  }

  void insertItem(TypeResumeSectionEnum item, List<TypeResumeSectionEnum> target, int index) {
    setState(() {
      removeItem(item);
      if (index >= target.length) {
        target.add(item);
      } else {
        target.insert(index, item);
      }
    });
  }

  void addToZone(TypeResumeSectionEnum item, List<TypeResumeSectionEnum> target) {
    setState(() {
      removeItem(item);
      target.add(item);
    });
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
          context.language.layout,
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
    return SingleChildScrollView(
      child: Column(
        children: [
          if (widget.userResumeEntity.numberOfColumns == 2) ...[
            WidthPercentageSlider(
              initialValue: widget.userResumeEntity.layouts[0].widthPercentage,
              onFinished: (value) {
                widget.userResumeEntity.layouts[0].widthPercentage = value;
                widget.userResumeEntity.layouts[1].widthPercentage = 100.0 - value;
              },
            )
          ],
          if (widget.userResumeEntity.numberOfColumns == 1) ...[
            buildEnumZone(context.language.dragAndDropSectionHere, usedSections),
          ],
          if (!(widget.userResumeEntity.numberOfColumns == 1)) ...[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: buildEnumZone(context.language.dragAndDropSectionHere, leftUsedSections)),
                const SizedBox(width: 2),
                Expanded(child: buildEnumZone(context.language.dragAndDropSectionHere, rightUsedSections)),
              ],
            ),
          ],
          const SizedBox(height: 16),
          buildEnumZoneUnuse(context.language.unUsedSections, unusedSections),
        ],
      ),
    );
  }

  Widget buildEnumZone(String title, List<TypeResumeSectionEnum> data) {
    return RepaintBoundary(
      child: DragTarget<TypeResumeSectionEnum>(
        onWillAcceptWithDetails: (DragTargetDetails<TypeResumeSectionEnum> details) {
          hoverNotifier.value = _HoverInfo(data, data.length, details.data);
          return true;
        },
        onAcceptWithDetails: (DragTargetDetails<TypeResumeSectionEnum> details) {
          hoverNotifier.value = null;
          addToZone(details.data, data);
        },
        builder: (_, __, ___) {
          return Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: Colors.black12, borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyleUtils.bold(color: context.theme.textColor, fontSize: 16)),
                const SizedBox(height: 10),

                ...data.asMap().entries.map((entry) {
                  int index = entry.key;
                  TypeResumeSectionEnum item = entry.value;

                  return DragTarget<TypeResumeSectionEnum>(
                    onWillAcceptWithDetails: (details) {
                      hoverNotifier.value = _HoverInfo(data, index, details.data);
                      return true;
                    },
                    onAcceptWithDetails: (details) {
                      hoverNotifier.value = null;
                      insertItem(details.data, data, index);
                    },
                    builder: (_, __, ___) {
                      return LongPressDraggable<TypeResumeSectionEnum>(
                        data: item,
                        feedback: Material(
                          borderRadius: BorderRadius.circular(4),
                          child: dragItemEnum(item),
                        ),
                        onDragEnd: (_) => hoverNotifier.value = null,
                        childWhenDragging: Opacity(opacity: 0.3, child: dragItemEnum(item)),

                        child: ValueListenableBuilder<_HoverInfo?>(
                          valueListenable: hoverNotifier,
                          builder: (_, hover, child) {
                            final isPreview =
                                hover != null && hover.target == data && hover.index == index && hover.dragged != item;

                            return AnimatedContainer(
                              duration: const Duration(milliseconds: 150),
                              transform: isPreview ? Matrix4.translationValues(0, 18, 0) : Matrix4.identity(),
                              curve: Curves.easeOut,
                              child: child,
                            );
                          },
                          child: dragItemEnum(item),
                        ),
                      );
                    },
                  );
                }),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildEnumZoneUnuse(String title, List<TypeResumeSectionEnum> data) {
    return RepaintBoundary(
      child: DragTarget<TypeResumeSectionEnum>(
        onWillAcceptWithDetails: (DragTargetDetails<TypeResumeSectionEnum> details) {
          hoverNotifier.value = _HoverInfo(data, data.length, details.data);
          return true;
        },
        onAcceptWithDetails: (DragTargetDetails<TypeResumeSectionEnum> details) {
          hoverNotifier.value = null;
          addToZone(details.data, data);
        },
        builder: (_, __, ___) {
          return Container(
            width: double.infinity,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(color: Colors.black12, borderRadius: BorderRadius.circular(10)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: TextStyleUtils.bold(color: context.theme.textColor, fontSize: 16)),
                const SizedBox(height: 10),
                LayoutBuilder(
                    builder: (context, constraints) {
                      final zoneWidth = constraints.maxWidth;
                      final itemWidth = (zoneWidth - 18) / 2;
                      return Stack(
                        children: [
                          Positioned(
                            left: zoneWidth / 2,
                            top: 4,
                            bottom: 4,
                            child: Container(
                              width: 2,
                              decoration: BoxDecoration(
                                color: context.theme.backgroundColor,
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                          ),
                          Wrap(
                            spacing: 18,
                            runSpacing: 0,
                            children: data.asMap().entries.map((entry) {
                              int index = entry.key;
                              TypeResumeSectionEnum item = entry.value;

                              return SizedBox(
                                width: itemWidth,
                                child: DragTarget<TypeResumeSectionEnum>(
                                  onWillAcceptWithDetails: (details) {
                                    hoverNotifier.value = _HoverInfo(data, index, details.data);
                                    return true;
                                  },
                                  onAcceptWithDetails: (details) {
                                    hoverNotifier.value = null;
                                    insertItem(details.data, data, index);
                                  },
                                  builder: (_, __, ___) {
                                    return LongPressDraggable<TypeResumeSectionEnum>(
                                      data: item,
                                      feedback: Material(
                                        borderRadius: BorderRadius.circular(4),
                                        child: dragItemEnumUnuse(item),
                                      ),
                                      onDragEnd: (_) => hoverNotifier.value = null,
                                      childWhenDragging: Opacity(opacity: 0.3, child: dragItemEnum(item)),

                                      child: ValueListenableBuilder<_HoverInfo?>(
                                        valueListenable: hoverNotifier,
                                        builder: (_, hover, child) {
                                          final isPreview =
                                              hover != null &&
                                                  hover.target == data &&
                                                  hover.index == index &&
                                                  hover.dragged != item;

                                          return AnimatedContainer(
                                            duration: const Duration(milliseconds: 150),
                                            transform: isPreview
                                                ? Matrix4.translationValues(0, 18, 0)
                                                : Matrix4.identity(),
                                            curve: Curves.easeOut,
                                            child: child,
                                          );
                                        },
                                        child: dragItemEnum(item),
                                      ),
                                    );
                                  },
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      );
                    }
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget dragItemEnum(TypeResumeSectionEnum e) {
    final width = widget.userResumeEntity.numberOfColumns == 1
        ? MediaQuery.of(context).size.width - 32
        : (MediaQuery.of(context).size.width - 50) / 2;
    return Container(
      width: width,
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: context.theme.backgroundColor,
        borderRadius: BorderRadius.circular(4),
        boxShadow: const [BoxShadow(blurRadius: 4, color: Colors.black26, offset: Offset(0, 2))],
      ),
      child: Row(
        children: [
          Icon(
            FontAwesomeIcons.puzzlePiece,
            size: 16,
            color: context.theme.darkGreyColor,
          ),
          SizedBox(width: 8),
          Expanded(
            child: Text(
                StringUtils.convertTypeResumeSectionEnum(context, e),
                style: TextStyleUtils.normal(
                  color: context.theme.textColor,
                  fontSize: 14,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis
            ),
          ),
        ],
      ),
    );
  }

  Widget dragItemEnumUnuse(TypeResumeSectionEnum e) {
    final width = (MediaQuery.of(context).size.width - 50) / 2;
    return Container(
      width: width,
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: context.theme.backgroundColor,
        borderRadius: BorderRadius.circular(4),
        boxShadow: const [BoxShadow(blurRadius: 4, color: Colors.black26, offset: Offset(0, 2))],
      ),
      child: Row(
        children: [
          Icon(
            FontAwesomeIcons.puzzlePiece,
            size: 16,
            color: context.theme.darkGreyColor,
          ),
          SizedBox(width: 8),
          Expanded(
            child: Text(
                StringUtils.convertTypeResumeSectionEnum(context, e),
                style: TextStyleUtils.normal(
                  color: context.theme.textColor,
                  fontSize: 14,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis
            ),
          ),
        ],
      ),
    );
  }

  Widget _buttonSave() {
    return InkWell(
      onTap: () {
        if(widget.userResumeEntity.numberOfColumns == 1) {
          widget.userResumeEntity.layouts.first.sections = usedSections;
        }
        else {
          widget.userResumeEntity.layouts[0].sections = leftUsedSections;
          widget.userResumeEntity.layouts[1].sections = rightUsedSections;
        }
        AutoRouter.of(context).pop(widget.userResumeEntity);
      },
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

class _HoverInfo {
  final List<TypeResumeSectionEnum> target;
  final int index;
  final TypeResumeSectionEnum dragged;

  _HoverInfo(this.target, this.index, this.dragged);
}
