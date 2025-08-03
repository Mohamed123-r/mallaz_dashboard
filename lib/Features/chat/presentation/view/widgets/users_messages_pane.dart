import 'package:book_apartment_dashboard/Features/chat/presentation/view/widgets/user_message_tile.dart';
import 'package:book_apartment_dashboard/core/widgets/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../data/models/chat_list_model.dart';
import '../../cubit/chat_cubit.dart';
import '../../cubit/chat_state.dart';

class UsersMessagesPane extends StatelessWidget {
  const UsersMessagesPane({

    super.key,
    required this.isDark,
    required this.onUserTap,
    required this.selectedUser,
  });

  final bool isDark;
  final void Function(dynamic user) onUserTap;
  final dynamic selectedUser;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchChatsCubit, ChatState>(
      builder: (context, state) {
        if (state is ChatListLoading) {
          return CustomLoading();
        }
        if (state is ChatListFailure) {
          return Center(child: Text("حدث خطأ: ${state.error}"));
        }
        if (state is ChatListLoaded) {
          final List users = state.chats;
          return Padding(
            padding: const EdgeInsets.only(top: 24, right: 24, left: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "رسائل المستخدمين",
                  style: AppTextStyles.buttonLarge20pxRegular(context).copyWith(
                    color: isDark ? AppColors.darkModeButtonsPrimary : AppColors.lightModeButtonsPrimary,
                  ),
                ),
                const SizedBox(height: 12),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: users.length,
                    itemBuilder: (context, i) {
                      final user = users[i];
                      return GestureDetector(
                        onTap: () => onUserTap(user),
                        child: UserMessageTile(
                          user: user,
                          isDark: isDark,
                          isSelected: selectedUser != null && selectedUser["senderId"] == user["senderId"],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}