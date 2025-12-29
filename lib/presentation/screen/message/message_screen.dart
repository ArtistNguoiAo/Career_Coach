import 'package:auto_route/auto_route.dart';
import 'package:career_coach/domain/enum/type_interview_status_enum.dart';
import 'package:career_coach/domain/enum/type_message_role_enum.dart';
import 'package:career_coach/presentation/core/extension/ext_context.dart';
import 'package:career_coach/presentation/core/route/app_router.gr.dart';
import 'package:career_coach/presentation/core/utils/dialog_utils.dart';
import 'package:career_coach/presentation/core/utils/media_utils.dart';
import 'package:career_coach/presentation/core/utils/string_utils.dart';
import 'package:career_coach/presentation/core/utils/text_style_utils.dart';
import 'package:career_coach/presentation/core/widgets/base_text_field.dart';
import 'package:career_coach/presentation/screen/message/cubit/message_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:iconly/iconly.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

@RoutePage()
class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key, required this.sessionId, required this.status});

  final int sessionId;
  final TypeInterviewStatusEnum status;

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _contentController = TextEditingController();
  var isChanged = false;

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.minScrollExtent,
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  void initState() {
    isChanged = widget.status == TypeInterviewStatusEnum.ACTIVE;
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MessageCubit()..init(widget.sessionId, widget.status),
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 16, left: 16, right: 16, bottom: 16),
          color: context.theme.backgroundColor,
          child: Column(
            children: [
              _header(),
              const SizedBox(height: 16),
              Expanded(child: _listMessage()),
              const SizedBox(height: 8),
              _sendMessageBar(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _header() {
    return BlocConsumer<MessageCubit, MessageState>(
      listener: (context, state) {
        if (state.isLoadingTotal) {
          DialogUtils.showLoadingDialog(context);
        } else {
          DialogUtils.hideLoadingDialog(context);
        }
        if (state.isEndInterviewSuccess) {
          isChanged = true;
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {
                   AutoRouter.of(context).maybePop(isChanged);
                  },
                  child: Icon(FontAwesomeIcons.chevronLeft, color: context.theme.textColor, size: 20),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Builder(
                    builder: (context) {
                      return InkWell(
                        onTap: () {
                          Scaffold.of(context).openEndDrawer();
                        },
                        child: Row(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(image: AssetImage(MediaUtils.imgChatbot), fit: BoxFit.cover),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Bot Assistant", style: TextStyleUtils.bold(color: context.theme.textColor)),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: state.status == TypeInterviewStatusEnum.ACTIVE
                                          ? context.theme.goodColor.withAlpha((255 * 0.1).round())
                                          : context.theme.mediumColor.withAlpha((255 * 0.1).round()),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Text(
                                      StringUtils.convertTypeInterviewStatusEnum(state.status),
                                      style: TextStyleUtils.bold(
                                        fontSize: 12,
                                        color: state.status == TypeInterviewStatusEnum.ACTIVE
                                            ? context.theme.goodColor
                                            : context.theme.mediumColor,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            if (state.status == TypeInterviewStatusEnum.ACTIVE) ...[
                              const SizedBox(width: 8),
                              InkWell(
                                onTap: () {
                                  DialogUtils.showEndPreviewDialog(
                                    context: context,
                                    onEnd: (bool isConfirm) {
                                      if (isConfirm) {
                                        context.read<MessageCubit>().endInterview();
                                      }
                                    },
                                  );
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                                  decoration: BoxDecoration(
                                    color: context.theme.badColor.withAlpha((255 * 0.1).round()),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(FontAwesomeIcons.stop, color: context.theme.badColor, size: 12),
                                      const SizedBox(width: 4),
                                      Text(
                                        context.language.end,
                                        style: TextStyleUtils.bold(fontSize: 12, color: context.theme.badColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Widget _listMessage() {
    return BlocConsumer<MessageCubit, MessageState>(
      listener: (context, state) {},
      builder: (context, state) {
        final countMinus = state.isLoading ? 1 : 0;
        return ListView.separated(
          controller: _scrollController,
          itemCount: state.listMessage.length + countMinus,
          padding: EdgeInsets.zero,
          reverse: true,
          itemBuilder: (context, index) {
            if (index == 0 && state.isLoading) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(image: AssetImage(MediaUtils.imgChatbot), fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(width: 8),
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                      decoration: BoxDecoration(
                        color: context.theme.primaryDarkColor.withAlpha((255 * 0.1).round()),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: LoadingAnimationWidget.staggeredDotsWave(color: context.theme.primaryDarkColor, size: 32),
                    ),
                  ),
                ],
              );
            } else {
              if (state.listMessage[index - countMinus].role == TypeMessageRoleEnum.USER) {
                return Align(
                  alignment: Alignment.centerRight,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: context.theme.primaryColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            state.listMessage[index - countMinus].content,
                            style: TextStyleUtils.normal(color: context.theme.backgroundColor),
                          ),
                          SizedBox(height: 4),
                          Text(
                            StringUtils.convertHourMinuteString(state.listMessage[index - countMinus].createdAt),
                            style: TextStyleUtils.normal(color: context.theme.lightGreyColor, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              } else {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(image: AssetImage(MediaUtils.imgChatbot), fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBox(width: 8),
                    ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: context.theme.primaryDarkColor.withAlpha((255 * 0.1).round()),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              state.listMessage[index - countMinus].content,
                              style: TextStyleUtils.normal(color: context.theme.primaryDarkColor),
                            ),
                            SizedBox(height: 4),
                            Text(
                              StringUtils.convertHourMinuteString(state.listMessage[index - countMinus].createdAt),
                              style: TextStyleUtils.normal(color: context.theme.darkGreyColor, fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }
            }
          },
          separatorBuilder: (context, index) => const SizedBox(height: 8),
        );
      },
    );
  }

  Widget _sendMessageBar() {
    return BlocBuilder<MessageCubit, MessageState>(
      builder: (context, state) {
        if(state.status == TypeInterviewStatusEnum.ACTIVE) {
          return Row(
            children: [
              Expanded(
                child: BaseTextField(
                  controller: _contentController,
                  style: TextStyleUtils.normal(color: context.theme.textColor),
                  hintStyle: TextStyleUtils.normal(color: context.theme.textColor.withAlpha((255 * 0.6).round())),
                  hintText: "Type a message...",
                  textInputAction: TextInputAction.newline,
                ),
              ),
              const SizedBox(width: 8),
              InkWell(
                onTap: () {
                  if (_contentController.text.trim().isEmpty) return;
                  context.read<MessageCubit>().sendMessage(_contentController.text.trim());
                  _contentController.clear();
                  _scrollToBottom();
                },
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(color: context.theme.primaryColor, shape: BoxShape.circle),
                  child: Center(child: Icon(IconlyBold.send, color: Colors.white, size: 24)),
                ),
              ),
            ],
          );
        }
        else {
          return InkWell(
            onTap: () {
              AutoRouter.of(context).push(AnalysisRoute(sessionId: widget.sessionId));
            },
            child: Container(
              padding: EdgeInsets.all(12),
              width: double.infinity,
              decoration: BoxDecoration(
                color: context.theme.primaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                context.language.interviewAnalysis,
                style: TextStyleUtils.normal(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          );
        }
      },
    );
  }
}
