import 'package:auto_route/auto_route.dart';
import 'package:career_coach/presentation/core/extension/ext_context.dart';
import 'package:career_coach/presentation/core/utils/dialog_utils.dart';
import 'package:career_coach/presentation/core/utils/text_style_utils.dart';
import 'package:career_coach/presentation/core/widgets/base_content_quill.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill_delta_from_html/flutter_quill_delta_from_html.dart';
import 'package:vsc_quill_delta_to_html/vsc_quill_delta_to_html.dart';
import 'package:career_coach/presentation/screen/section_resume/other_information/cubit/other_information_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

@RoutePage()
class OtherInformationScreen extends StatefulWidget {
  const OtherInformationScreen({super.key, required this.userResumeId});

  final int userResumeId;

  @override
  State<OtherInformationScreen> createState() => _OtherInformationScreenState();
}

class _OtherInformationScreenState extends State<OtherInformationScreen> {
  final QuillController _otherInfoController = QuillController(
    document: Document(),
    selection: const TextSelection.collapsed(offset: 0),
  );
  final FocusNode _otherInfoFocusNode = FocusNode();
  final ScrollController _otherInfoScrollController = ScrollController();

  @override
  void dispose() {
    _otherInfoController.dispose();
    _otherInfoFocusNode.dispose();
    _otherInfoScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      OtherInformationCubit()
        ..init(userResumeId: widget.userResumeId),
      child: Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              AutoRouter.of(context).maybePop();
            },
            child: Icon(FontAwesomeIcons.chevronLeft, color: context.theme.backgroundColor, size: 20),
          ),
          centerTitle: true,
          title: Text(
            context.language.otherInformation,
            style: TextStyleUtils.bold(color: context.theme.backgroundColor, fontSize: 18),
          ),
          backgroundColor: context.theme.primaryColor,
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          padding: const EdgeInsets.all(16.0),
          color: context.theme.backgroundColor,
          child: _body(),
        ),
      ),
    );
  }

  Widget _body() {
    return BlocConsumer<OtherInformationCubit, OtherInformationState>(
      listener: (context, state) {
        if (state.isLoading) {
          DialogUtils.showLoadingDialog(context);
        } else {
          DialogUtils.hideLoadingDialog(context);
        }
        if (state.isSavedSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                context.language.saveInformationSuccess,
                style: TextStyleUtils.normal(color: context.theme.backgroundColor, fontSize: 12),
              ),
              backgroundColor: context.theme.goodColor,
              duration: const Duration(seconds: 1),
            ),
          );
        }
        if (state.error.isNotEmpty) {
          DialogUtils.showErrorDialog(context: context, message: state.error);
          state.error = '';
        }

        if (state.otherInformationEntity?.content != null && state.otherInformationEntity!.content.isNotEmpty) {
          _otherInfoController.document = Document.fromDelta(
            HtmlToDelta().convert(state.otherInformationEntity!.content),
          );
        }
        _otherInfoFocusNode.unfocus();
      },
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BaseContentQuill(
                      controller: _otherInfoController,
                      focusNode: _otherInfoFocusNode,
                      scrollController: _otherInfoScrollController,
                      isRequired: true,
                      title: context.language.information,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            InkWell(
              onTap: () {
                _otherInfoFocusNode.unfocus();
                FocusManager.instance.primaryFocus?.unfocus();

                final content = QuillDeltaToHtmlConverter(
                  _otherInfoController.document.toDelta().toJson(),
                  ConverterOptions(),
                ).convert();

                state.otherInformationEntity?.content = content;
                context.read<OtherInformationCubit>().save();
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
            ),
          ],
        );
      },
    );
  }
}
