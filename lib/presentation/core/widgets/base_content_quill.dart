import 'package:career_coach/presentation/core/extension/ext_context.dart';
import 'package:career_coach/presentation/core/utils/text_style_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class BaseContentQuill extends StatefulWidget {
  const BaseContentQuill({
    super.key,
    required this.controller,
    required this.focusNode,
    required this.scrollController,
    required this.isRequired,
    required this.title,
  });

  final QuillController controller;
  final FocusNode focusNode;
  final ScrollController scrollController;
  final bool isRequired;
  final String title;

  @override
  State<BaseContentQuill> createState() => _BaseContentQuillState();
}

class _BaseContentQuillState extends State<BaseContentQuill> {
  final GlobalKey _key = GlobalKey();

  @override
  void initState() {
    super.initState();
    widget.focusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    if (widget.focusNode.hasFocus) {
      Future.delayed(const Duration(milliseconds: 300), () {
        if (!mounted || _key.currentContext == null) return;

        Scrollable.ensureVisible(
          _key.currentContext!,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
          alignment: 0.2,
        );
      });
    }
    if (mounted) setState(() {});
  }

  @override
  void dispose() {
    widget.focusNode.removeListener(_onFocusChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _key,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(
            TextSpan(
              text: widget.title,
              style: TextStyleUtils.bold(
                color: context.theme.textColor,
              ),
              children: [
                if (widget.isRequired)
                  TextSpan(
                    text: ' *',
                    style: TextStyleUtils.bold(
                      color: context.theme.badColor,
                    )
                  ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Container(
            decoration: BoxDecoration(
              color: context.theme.backgroundColor,
              border: Border.all(
                color: widget.focusNode.hasFocus ? context.theme.primaryColor : context.theme.borderColor,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: QuillEditor(
              controller: widget.controller,
              focusNode: widget.focusNode,
              scrollController: widget.scrollController,
              config: QuillEditorConfig(
                scrollable: false,
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              ),
            ),
          ),
          Theme(
            data: Theme.of(context).copyWith(
              colorScheme: Theme.of(context).colorScheme.copyWith(
                primary: context.theme.primaryColor,
                onPrimary: Colors.white,
              ),
            ),
            child: QuillSimpleToolbar(
              controller: widget.controller,
              config: QuillSimpleToolbarConfig(
                showUndo: true,
                showRedo: true,
                showBoldButton: true,
                showItalicButton: true,
                showUnderLineButton: true,
                showStrikeThrough: true,
                showListBullets: true,
                showListNumbers: true,
                showQuote: false,
                showCodeBlock: false,
                showInlineCode: false,
                showIndent: false,
                showLink: false,
                showFontFamily: false,
                showFontSize: false,
                showColorButton: false,
                showBackgroundColorButton: false,
                showAlignmentButtons: false,
                showClearFormat: false,
                showClipboardCopy: false,
                showClipboardCut: false,
                showClipboardPaste: false,
                showHeaderStyle: false,
                showListCheck: false,
                showSearchButton: false,
                showSuperscript: false,
                showSubscript: false,
              ),
            ),
          )
        ],
      ),
    );
  }
}
