import 'package:book_apartment_dashboard/core/widgets/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../constant.dart';
import '../../../../../core/database/cache/cache_helper.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../generated/l10n.dart';
import '../../cubit/chat_cubit.dart';
import '../../cubit/chat_state.dart';

class CurrentChatPane extends StatefulWidget {
  const CurrentChatPane({
    super.key,
    required this.isDark,
    required this.selectedUser,
    required this.currentUserId,
    required this.chatId,
  });

  final bool isDark;
  final dynamic selectedUser;
  final String currentUserId;
  final int chatId;

  @override
  State<CurrentChatPane> createState() => _CurrentChatPaneState();
}

class _CurrentChatPaneState extends State<CurrentChatPane> {
  final TextEditingController _controller = TextEditingController();

  bool deleteMessage = false;

  @override
  void initState() {
    super.initState();
    if (widget.selectedUser != null && widget.currentUserId != null) {
      context.read<ChatCubit>().fetchChatHistory(widget.currentUserId!);
      _startPolling();
    }
  }

  void _startPolling() {
    const duration = Duration(seconds: 1);
    Future.doWhile(() async {
      if (widget.selectedUser != null && widget.currentUserId != null) {
        await context.read<ChatCubit>().fetchChatHistory(widget.currentUserId!);
      }
      await Future.delayed(duration);
      return true;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final user = widget.selectedUser;
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 28,
        end: 10,
        top: 24,
        bottom: 10,
      ),
      child:
          user == null
              ? Center(child: Text(S.of(context).select_chat))
              : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Text(
                      S.of(context).currentChat,
                      style: AppTextStyles.buttonLarge20pxRegular(
                        context,
                      ).copyWith(
                        color:
                            widget.isDark
                                ? AppColors.darkModeButtonsPrimary
                                : AppColors.lightModeButtonsPrimary,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 9,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.darkModeText,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage:
                              user["userImage"] != null &&
                                      user["userImage"]!.isNotEmpty
                                  ? NetworkImage(user["userImage"]!)
                                  : null,
                          radius: 20,
                          child:
                              user["userImage"] == null
                                  ? Icon(Icons.person, size: 24)
                                  : null,
                        ),
                        const SizedBox(width: 9),
                        Text(
                          user["userName"],
                          style: AppTextStyles.subtitle16pxRegular(context),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: BlocBuilder<ChatCubit, ChatState>(
                      builder: (context, state) {
                        if (state is ChatHistoryLoading) {
                          return CustomLoading();
                        }
                        if (state is ChatHistoryFailure) {
                          return Center(child: Text(state.error));
                        }
                        if (state is ChatHistoryLoaded) {
                          final data = state.data;
                          return ListView.builder(
                            itemCount: data.length,
                            reverse: true,
                            padding: const EdgeInsets.only(top: 12, bottom: 12),
                            itemBuilder: (context, i) {
                              final msg = data[data.length - 1 - i];
                              final isMe =
                                  msg["senderUserId"] == widget.currentUserId;
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 8,
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      isMe
                                          ? MainAxisAlignment.end
                                          : MainAxisAlignment.start,
                                  children: [
                                    if (!isMe) const SizedBox(width: 7),
                                    Flexible(
                                      child: Column(
                                        crossAxisAlignment:
                                            isMe
                                                ? CrossAxisAlignment.end
                                                : CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              const SizedBox(width: 4),
                                              Text(
                                                msg["createdAt"] ?? "",
                                                style: const TextStyle(
                                                  color: Colors.black54,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 12,
                                                ),
                                              ),
                                              const SizedBox(width: 4),
                                              Text(
                                                user["userName"] ?? "",
                                                style: const TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            msg["content"] ?? "",
                                            textAlign:
                                                isMe
                                                    ? TextAlign.right
                                                    : TextAlign.left,
                                            style: const TextStyle(
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (isMe) const SizedBox(width: 7),
                                    if (isMe)
                                      Row(
                                        children: [
                                          const CircleAvatar(
                                            backgroundImage: null,
                                            radius: 17,
                                            child: Icon(Icons.person, size: 20),
                                          ),
                                          IconButton(
                                            icon: const Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                            ),
                                            onPressed: () async {
                                              await showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    title: Text(
                                                      S
                                                          .of(context)
                                                          .delete_massage,
                                                    ),
                                                    content: Text(
                                                      S
                                                          .of(context)
                                                          .delete_massage_confirmation,
                                                    ),
                                                    actions: [
                                                      TextButton(
                                                        onPressed: () {
                                                          Navigator.of(
                                                            context,
                                                          ).pop();
                                                        },
                                                        child: Text(
                                                          S.of(context).cancel,
                                                        ),
                                                      ),
                                                      TextButton(
                                                        onPressed: () async {
                                                          deleteMessage = true;

                                                          Navigator.of(
                                                            context,
                                                          ).pop();
                                                        },
                                                        child: Text(
                                                          S.of(context).delete,
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                },
                                              );
                                              deleteMessage
                                                  ? await context
                                                      .read<ChatCubit>()
                                                      .deleteSpecificMessage(
                                                        msg["id"],
                                                      )
                                                  : null;
                                            },
                                          ),
                                        ],
                                      ),
                                  ],
                                ),
                              );
                            },
                          );
                        }
                        return Center(
                          child: Text(
                            S.of(context).no_message,
                            style: AppTextStyles.subtitle16pxRegular(context),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    height: 52,
                    margin: const EdgeInsets.only(top: 8),
                    decoration: BoxDecoration(
                      color:
                          widget.isDark
                              ? AppColors.darkModeBackground
                              : Colors.white,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 32,
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                              color:
                                  widget.isDark
                                      ? AppColors.darkModeBackground
                                      : Colors.white,
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: Row(
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.emoji_emotions_outlined,
                                    color: Colors.black54,
                                  ),
                                  onPressed: () {},
                                ),
                                Expanded(
                                  child: TextField(
                                    controller: _controller,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      isDense: true,
                                      contentPadding: EdgeInsets.only(
                                        bottom: 10,
                                        left: 6,
                                      ),
                                      hintText: '',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.send, color: Colors.black87),
                          onPressed: () async {
                            final text = _controller.text.trim();
                            if (text.isNotEmpty &&
                                widget.selectedUser != null &&
                                widget.currentUserId != null) {
                              await context.read<ChatCubit>().sendMessage(
                                receiverUserId:
                                    CacheHelper().getMap(
                                      key: userData,
                                    )!['userId'],
                                content: text,
                              );
                              _controller.clear();
                              await context.read<ChatCubit>().fetchChatHistory(
                                widget.currentUserId!,
                              );
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
    );
  }
}
