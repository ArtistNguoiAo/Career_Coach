import 'package:auto_route/auto_route.dart';
import 'package:career_coach/domain/enum/type_message_role_enum.dart';
import 'package:career_coach/presentation/core/extension/ext_context.dart';
import 'package:career_coach/presentation/core/utils/media_utils.dart';
import 'package:career_coach/presentation/core/utils/string_utils.dart';
import 'package:career_coach/presentation/core/utils/text_style_utils.dart';
import 'package:career_coach/presentation/core/widgets/base_text_field.dart';
import 'package:career_coach/presentation/screen/message/cubit/message_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

@RoutePage()
class MessageScreen extends StatelessWidget {
  const MessageScreen({super.key, required this.sessionId});

  final int sessionId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MessageCubit()..init(sessionId),
      child: MessageScreenUI(sessionId: sessionId),
    );
  }
}

class MessageScreenUI extends StatefulWidget {
  const MessageScreenUI({super.key, required this.sessionId});

  final int sessionId;

  @override
  State<MessageScreenUI> createState() => _MessageScreenUIState();
}

class _MessageScreenUIState extends State<MessageScreenUI> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _contentController = TextEditingController();

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
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }

  Widget _header() {
    return Column(
      children: [
        Row(
          children: [
            InkWell(
              onTap: () {
                context.router.maybePop();
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
                            border: Border.all(color: context.theme.primaryDarkColor, width: 1),
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(MediaUtils.imgChatbot),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Career Coach Bot",
                              style: TextStyleUtils.bold(color: context.theme.textColor),
                            ),
                          ],
                        ),
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
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.7),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                      decoration: BoxDecoration(
                        color: context.theme.backgroundColor.withAlpha((255 * 0.8).round()),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: LoadingAnimationWidget.staggeredDotsWave(color: context.theme.primaryColor, size: 32),
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
                        border: Border.all(color: context.theme.primaryDarkColor, width: 1),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(MediaUtils.imgChatbot),
                          fit: BoxFit.cover,
                        ),
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
          separatorBuilder: (context, index) => const SizedBox(height: 8)
        );
      },
    );
  }

  Widget _sendMessageBar() {
    return Builder(
      builder: (context) {
        return BaseTextField(
          controller: _contentController,
          style: TextStyleUtils.normal(color: context.theme.backgroundColor),
          hintStyle: TextStyleUtils.normal(color: context.theme.backgroundColor.withAlpha((255 * 0.6).round())),
          hintText: "Type a message...",
          onFieldSubmitted: (value) {
            _scrollToBottom();
          },
        );
      },
    );
  }
}
