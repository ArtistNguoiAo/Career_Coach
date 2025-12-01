import 'package:auto_route/auto_route.dart';
import 'package:career_coach/domain/entity/user_resume_entity.dart';
import 'package:career_coach/domain/enum/type_font_family_enum.dart';
import 'package:career_coach/domain/enum/type_language_enum.dart';
import 'package:career_coach/presentation/core/extension/ext_context.dart';
import 'package:career_coach/presentation/core/utils/string_utils.dart';
import 'package:career_coach/presentation/core/utils/text_style_utils.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EndDrawerPreviewResume extends StatefulWidget {
  const EndDrawerPreviewResume({super.key, required this.userResumeEntity, required this.onChanged});

  final UserResumeEntity? userResumeEntity;
  final ValueChanged<UserResumeEntity> onChanged;

  @override
  State<EndDrawerPreviewResume> createState() => _EndDrawerPreviewResumeState();
}

class _EndDrawerPreviewResumeState extends State<EndDrawerPreviewResume> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late TypeLanguageEnum _language;
  late TypeFontFamilyEnum _fontFamily;
  late int _fontSize;
  late double _lineHeight;
  late String _color;
  late Color _currentColor;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _language = widget.userResumeEntity?.language ?? TypeLanguageEnum.VIETNAMESE;
    _fontFamily = widget.userResumeEntity?.fontFamily ?? TypeFontFamilyEnum.ARIAL;
    _fontSize = widget.userResumeEntity?.fontSize ?? 16;
    _lineHeight = widget.userResumeEntity?.lineHeight ?? 1.5;
    _color = widget.userResumeEntity?.color ?? '#000000';
    _currentColor = Color(int.parse(_color.replaceFirst('#', '0xff')));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + kToolbarHeight),
      child: Drawer(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          color: context.theme.backgroundColor,
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(child: _tabBarView()),
                    _tabBar(),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              _buttonSave(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tabBarView() {
    return RotatedBox(
      quarterTurns: 1,
      child: TabBarView(
        controller: _tabController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          _tabBarViewFirst(),
          _tabBarViewSecond()
        ],
      ),
    );
  }

  Widget _tabBarViewFirst() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const SizedBox(width: 8),
        RotatedBox(
          quarterTurns: 3,
          child: Text(context.language.chooseLanguage, style: TextStyleUtils.bold(fontSize: 16)),
        ),
        const SizedBox(width: 8),
        RotatedBox(
          quarterTurns: 3,
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: TypeLanguageEnum.values.map((lang) {
              final isSelected = _language == lang;
              return InkWell(
                onTap: () {
                  setState(() {
                    _language = lang;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: isSelected ? context.theme.primaryColor.withAlpha((255 * 0.1).round()) : null,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: isSelected ? context.theme.primaryColor : context.theme.darkGreyColor,
                    ),
                  ),
                  child: Text(
                    StringUtils.convertTypeLanguageEnum(context, lang),
                    style: TextStyleUtils.normal(
                      fontSize: 14,
                      color: isSelected ? context.theme.primaryColor : context.theme.textColor,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(width: 16),
        RotatedBox(
          quarterTurns: 3,
          child: Text(context.language.chooseFont, style: TextStyleUtils.bold(fontSize: 16)),
        ),
        const SizedBox(width: 8),
        RotatedBox(
          quarterTurns: 3,
          child: Wrap(
            spacing: 8,
            runSpacing: 8,
            children: TypeFontFamilyEnum.values.map((font) {
              final isSelected = _fontFamily == font;
              return InkWell(
                onTap: () {
                  setState(() {
                    _fontFamily = font;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: isSelected ? context.theme.primaryColor.withAlpha((255 * 0.1).round()) : null,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: isSelected ? context.theme.primaryColor : context.theme.darkGreyColor,
                    ),
                  ),
                  child: Text(
                    StringUtils.convertTypeFontFamilyEnum(context, font),
                    style: TextStyleUtils.normal(
                      fontSize: 14,
                      color: isSelected ? context.theme.primaryColor : context.theme.textColor,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
        const SizedBox(width: 16),
        RotatedBox(
          quarterTurns: 3,
          child: Text(context.language.chooseFontSize, style: TextStyleUtils.bold(fontSize: 16)),
        ),
        const SizedBox(width: 8),
        RotatedBox(
          quarterTurns: 3,
          child: Slider(
            min: 10,
            max: 30,
            divisions: 20,
            value: _fontSize.toDouble(),
            label: _fontSize.toString(),
            padding: EdgeInsets.symmetric(horizontal: 8),
            activeColor: context.theme.primaryColor,
            onChanged: (value) {
              setState(() {
                _fontSize = value.round();
              });
            },
          ),
        ),
        RotatedBox(
          quarterTurns: 3,
          child: Row(
            children: [
              SizedBox(width: 8),
              Text("10", style: TextStyleUtils.normal(fontSize: 12)),
              Expanded(child: SizedBox()),
              Text("30", style: TextStyleUtils.normal(fontSize: 12)),
              SizedBox(width: 8),
            ],
          ),
        ),
        const SizedBox(width: 16),
        RotatedBox(
          quarterTurns: 3,
          child: Text(context.language.chooseLineHeight, style: TextStyleUtils.bold(fontSize: 16)),
        ),
        const SizedBox(width: 8),
        RotatedBox(
          quarterTurns: 3,
          child: Slider(
            min: 1,
            max: 2,
            divisions: 10,
            value: _lineHeight,
            label: _lineHeight.toString(),
            padding: EdgeInsets.symmetric(horizontal: 8),
            activeColor: context.theme.primaryColor,
            onChanged: (value) {
              setState(() {
                _lineHeight = value;
              });
            },
          ),
        ),
        RotatedBox(
          quarterTurns: 3,
          child: Row(
            children: [
              SizedBox(width: 8),
              Text("1.0", style: TextStyleUtils.normal(fontSize: 12)),
              Expanded(child: SizedBox()),
              Text("2.0", style: TextStyleUtils.normal(fontSize: 12)),
              SizedBox(width: 8),
            ],
          ),
        ),
      ],
    );
  }

  Widget _tabBarViewSecond() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const SizedBox(width: 8),
        RotatedBox(
          quarterTurns: 3,
          child: Text(context.language.chooseColor, style: TextStyleUtils.bold(fontSize: 16)),
        ),
        const SizedBox(width: 8),
        RotatedBox(
          quarterTurns: 3,
          child: ColorPicker(
            padding: EdgeInsets.symmetric(horizontal: 8),
            color: _currentColor,
            onColorChanged: (color) {
              setState(() {
                _currentColor = color;
                _color = '#${color.toARGB32().toRadixString(16).substring(2).toUpperCase()}';
              });
            },
            borderRadius: 10,
            spacing: 5,
            runSpacing: 5,
            wheelDiameter: 200,
            pickersEnabled: <ColorPickerType, bool>{
              ColorPickerType.wheel: true,
              ColorPickerType.both: false,
              ColorPickerType.primary: false,
              ColorPickerType.accent: false,
              ColorPickerType.custom: false,
              ColorPickerType.bw: false,
            },
            enableShadesSelection: false,
            showColorCode: true,
            colorCodeHasColor: true,
          ),
        ),
      ],
    );
  }

  Widget _tabBar() {
    return RotatedBox(
      quarterTurns: 1,
      child: TabBar(
        controller: _tabController,
        dividerColor: Colors.transparent,
        indicatorColor: context.theme.primaryColor,
        labelColor: context.theme.primaryColor,
        unselectedLabelColor: context.theme.borderColor,
        indicatorSize: TabBarIndicatorSize.tab,
        padding: const EdgeInsets.symmetric(horizontal: 0),
        tabs: const [
          Tab(icon: RotatedBox(quarterTurns: 3, child: Icon(FontAwesomeIcons.font, size: 20))),
          Tab(icon: RotatedBox(quarterTurns: 3, child: Icon(FontAwesomeIcons.palette, size: 20))),
        ],
      ),
    );
  }

  Widget _buttonSave() {
    return InkWell(
      onTap: () {
        if (widget.userResumeEntity == null) return;
        AutoRouter.of(context).maybePop();
        widget.userResumeEntity?.language = _language;
        widget.userResumeEntity?.fontFamily = _fontFamily;
        widget.userResumeEntity?.fontSize = _fontSize;
        widget.userResumeEntity?.lineHeight = _lineHeight;
        widget.userResumeEntity?.color = _color;
        widget.onChanged(widget.userResumeEntity!);
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
