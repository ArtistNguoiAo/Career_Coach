import 'package:auto_route/auto_route.dart';
import 'package:career_coach/domain/entity/user_resume_entity.dart';
import 'package:career_coach/domain/enum/type_font_family_enum.dart';
import 'package:career_coach/domain/enum/type_language_enum.dart';
import 'package:career_coach/presentation/core/extension/ext_context.dart';
import 'package:career_coach/presentation/core/utils/string_utils.dart';
import 'package:career_coach/presentation/core/utils/text_style_utils.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';

class EndDrawerPreviewResume extends StatefulWidget {
  const EndDrawerPreviewResume({super.key, required this.userResumeEntity, required this.onChanged});

  final UserResumeEntity? userResumeEntity;
  final ValueChanged<UserResumeEntity> onChanged;

  @override
  State<EndDrawerPreviewResume> createState() => _EndDrawerPreviewResumeState();
}

class _EndDrawerPreviewResumeState extends State<EndDrawerPreviewResume> {
  late TypeLanguageEnum _language;
  late TypeFontFamilyEnum _fontFamily;
  late int _fontSize;
  late double _lineHeight;
  late String _color;
  late Color _currentColor;

  @override
  void initState() {
    super.initState();
    _language = widget.userResumeEntity?.language ?? TypeLanguageEnum.VIETNAMESE;
    _fontFamily = widget.userResumeEntity?.fontFamily ?? TypeFontFamilyEnum.ARIAL;
    _fontSize = widget.userResumeEntity?.fontSize ?? 16;
    _lineHeight = widget.userResumeEntity?.lineHeight ?? 1.5;
    _color = widget.userResumeEntity?.color ?? '#000000';
    _currentColor = Color(int.parse(_color.replaceFirst('#', '0xff')));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + kToolbarHeight,
        bottom:  MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Drawer(
        child: Container(
          padding: const EdgeInsets.all(8.0),
          color: context.theme.backgroundColor,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 8),
                      Text(context.language.chooseLanguage, style: TextStyleUtils.bold(fontSize: 16)),
                      const SizedBox(height: 8),
                      Wrap(
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
                                StringUtils.convertTypeLanguageEnum(lang),
                                style: TextStyleUtils.normal(
                                  fontSize: 14,
                                  color: isSelected ? context.theme.primaryColor : context.theme.textColor,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 16),
                      Text(context.language.chooseFont, style: TextStyleUtils.bold(fontSize: 16)),
                      const SizedBox(height: 8),
                      Wrap(
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
                      const SizedBox(height: 16),
                      Text(context.language.chooseFontSize, style: TextStyleUtils.bold(fontSize: 16)),
                      const SizedBox(height: 8),
                      Slider(
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
                      Row(
                        children: [
                          SizedBox(width: 8),
                          Text("10", style: TextStyleUtils.normal(fontSize: 12)),
                          Expanded(child: SizedBox()),
                          Text("30", style: TextStyleUtils.normal(fontSize: 12)),
                          SizedBox(width: 8),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(context.language.chooseLineHeight, style: TextStyleUtils.bold(fontSize: 16)),
                      const SizedBox(height: 8),
                      Slider(
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
                      Row(
                        children: [
                          SizedBox(width: 8),
                          Text("1.0", style: TextStyleUtils.normal(fontSize: 12)),
                          Expanded(child: SizedBox()),
                          Text("2.0", style: TextStyleUtils.normal(fontSize: 12)),
                          SizedBox(width: 8),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Text(context.language.chooseColor, style: TextStyleUtils.bold(fontSize: 16)),
                      const SizedBox(width: 8),
                      ColorPicker(
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
                    ],
                  ),
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
