import 'package:book_apartment_dashboard/Features/chat/presentation/view/widgets/current_chat_pane.dart';
import 'package:book_apartment_dashboard/Features/chat/presentation/view/widgets/users_messages_pane.dart';
import 'package:book_apartment_dashboard/core/utils/app_colors.dart';
import 'package:book_apartment_dashboard/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/helper_functions/get_it.dart';
import '../../../../core/services/theme_cubit.dart';
import '../../data/models/chat_list_model.dart';
import '../../data/repo/chat_repo.dart';
import '../cubit/chat_cubit.dart';
import '../cubit/chat_state.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  dynamic selectedUser = null;
  String selectedChatId = "";
  int chatId = 0;

  @override
  void initState() {
    super.initState();
    context.read<FetchChatsCubit>().fetchChats();
  }

  void onUserSelected(final user) {
    setState(() {
      selectedUser = user;
      selectedChatId = user["senderId"];
      chatId = user["chatId"];
    });
    context.read<ChatCubit>().fetchChatHistory(selectedChatId);
    context.read<ChatCubit>().markAllMessagesRead(chatId.toString());

  }

  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<ThemeCubit>().state == ThemeMode.dark;
    return Row(
      children: [
        Expanded(
          flex: 6,
          child: UsersMessagesPane(
            isDark: isDark,
            onUserTap: onUserSelected,
            selectedUser: selectedUser,
          ),
        ),
        VerticalDivider(width: 1, thickness: 1, color: AppColors.graysGray2),
        Expanded(
          flex: 7,
          child: CurrentChatPane(
            isDark: isDark,
            selectedUser: selectedUser,
            currentUserId: selectedChatId,
            chatId: chatId ,
          ),
        ),
      ],
    );
  }
}
