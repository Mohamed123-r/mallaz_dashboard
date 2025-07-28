import 'package:book_apartment_dashboard/core/utils/app_colors.dart';
import 'package:book_apartment_dashboard/core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/locale_cubit.dart';
import '../../../../core/services/theme_cubit.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<ThemeCubit>().state == ThemeMode.dark;
 return Row(
      children: [
        Expanded(flex: 6, child: UsersMessagesPane(isDark: isDark)),
        VerticalDivider(width: 1, thickness: 1, color: AppColors.graysGray2),
        Expanded(flex: 7, child: CurrentChatPane(isDark: isDark)),
      ],
    );
  }
}

class CurrentChatPane extends StatelessWidget {
  const CurrentChatPane({super.key, required this.isDark});

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 28,
        end: 10,
        top: 24,
        bottom: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 12),
            child: Text(
              "الدردشة الجارية",
              style: AppTextStyles.buttonLarge20pxRegular(context).copyWith(
                color:
                    isDark
                        ? AppColors.darkModeButtonsPrimary
                        : AppColors.lightModeButtonsPrimary,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 9),
            decoration: BoxDecoration(
              color: AppColors.darkModeText,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                    "https://randomuser.me/api/portraits/women/44.jpg",
                  ),
                  radius: 22,
                ),

                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "اسماء حسن",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "نشطة الآن",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.call, color: Colors.black87),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.videocam, color: Colors.black87),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Expanded(child: _ChatMessagesList()),
          _ChatInputBar(isDark),
        ],
      ),
    );
  }
}

class _ChatMessagesList extends StatelessWidget {
  const _ChatMessagesList();

  @override
  Widget build(BuildContext context) {
    final messages = [
      ChatMessage(
        isMe: false,
        name: "اسماء حسن",
        avatar: "https://randomuser.me/api/portraits/women/44.jpg",
        time: "4:27 مساء",
        text: "مساء الخير، هل الوحدة اللي في شارع الزهره لسه متاحة؟",
      ),
      ChatMessage(
        isMe: true,
        name: "أنا",
        avatar: "https://randomuser.me/api/portraits/men/45.jpg",
        time: "4:27 مساء",
        text: "مساء النور، أيوه الوحدة لسه متاحة حالياً.",
      ),
      ChatMessage(
        isMe: false,
        name: "اسماء حسن",
        avatar: "https://randomuser.me/api/portraits/women/44.jpg",
        time: "4:27 مساء",
        text: "تمام. السعر كام وفيها تكييف؟",
      ),
      ChatMessage(
        isMe: true,
        name: "أنا",
        avatar: "https://randomuser.me/api/portraits/men/45.jpg",
        time: "4:27 مساء",
        text: "السعر 3500 جنيه شهرياً. وفيها تكييف وأثاث كامل.",
      ),
      ChatMessage(
        isMe: false,
        name: "اسماء حسن",
        avatar: "https://randomuser.me/api/portraits/women/44.jpg",
        time: "4:27 مساء",
        text: "شكراً",
      ),
    ];
    return ListView.builder(
      itemCount: messages.length,
      padding: const EdgeInsets.only(top: 12, bottom: 12),
      itemBuilder: (context, i) {
        final msg = messages[i];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment:
                msg.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: [
              if (!msg.isMe)
                CircleAvatar(
                  backgroundImage: NetworkImage(msg.avatar),
                  radius: 17,
                ),
              if (!msg.isMe) const SizedBox(width: 7),
              Flexible(
                child: Column(
                  crossAxisAlignment:
                      msg.isMe
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          msg.name,
                          style: const TextStyle(fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          msg.time,
                          style: const TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      msg.text,
                      textAlign: msg.isMe ? TextAlign.right : TextAlign.left,
                      style: const TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
              if (msg.isMe) const SizedBox(width: 7),
              if (msg.isMe)
                CircleAvatar(
                  backgroundImage: NetworkImage(msg.avatar),
                  radius: 17,
                ),
            ],
          ),
        );
      },
    );
  }
}

class ChatMessage {
  final bool isMe;
  final String name;
  final String avatar;
  final String time;
  final String text;

  ChatMessage({
    required this.isMe,
    required this.name,
    required this.avatar,
    required this.time,
    required this.text,
  });
}

class _ChatInputBar extends StatelessWidget {
  const _ChatInputBar(this.isDark);

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 52,
      margin: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkModeBackground : Colors.white,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.more_horiz, color: Colors.black87),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.camera_alt_outlined, color: Colors.black87),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.image_outlined, color: Colors.black87),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.attach_file, color: Colors.black87),
            onPressed: () {},
          ),
          Expanded(
            child: Container(
              height: 32,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                color: isDark ? AppColors.darkModeBackground : Colors.white,
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
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.only(bottom: 10, left: 6),
                        hintText: '',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.thumb_up_alt_outlined,
              color: Colors.black87,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}


class UsersMessagesPane extends StatelessWidget {
  const UsersMessagesPane({super.key, required this.isDark});

  final bool isDark;

  @override
  Widget build(BuildContext context) {
  final users = [
      UserMsg(
        name: "اسماء حسن",
        lastMsg: "شقه ايجار بمنطقة الاسكندرية",
        time: "12:55 ص",
        img: "https://randomuser.me/api/portraits/women/44.jpg",
        unread: 2,
        isNew: true,
      ),
      UserMsg(
        name: "محمد السيد",
        lastMsg: "شقه ايجار بمنطقة الاسكندرية",
        time: "12:55 ص",
        img: "https://randomuser.me/api/portraits/men/46.jpg",
        unread: 2,
        isNew: true,
      ),
      UserMsg(
        name: "محمد السيد",
        lastMsg: "شقه ايجار بمنطقة الاسكندرية",
        time: "12:55 ص",
        img: "https://randomuser.me/api/portraits/men/47.jpg",
      ),
      UserMsg(
        name: "محمد السيد",
        lastMsg: "شقه ايجار بمنطقة الاسكندرية",
        time: "12:55 ص",
        img: "https://randomuser.me/api/portraits/men/48.jpg",
      ),
      UserMsg(
        name: "محمد السيد",
        lastMsg: "شقه ايجار بمنطقة الاسكندرية",
        time: "12:55 ص",
        img: "https://randomuser.me/api/portraits/men/49.jpg",
      ),
    ];
    return Padding(
      padding: const EdgeInsets.only(top: 24, right: 24, left: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            "رسائل المستخدمين",
            style: AppTextStyles.buttonLarge20pxRegular(context).copyWith(
              color:
                  isDark
                      ? AppColors.darkModeButtonsPrimary
                      : AppColors.lightModeButtonsPrimary,
            ),
          ),
          const SizedBox(height: 12),
          Container(
            height: 42,
            margin: const EdgeInsets.only(bottom: 18),
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: AppColors.graysGray2, width: 1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'البحث',
                  border: InputBorder.none,
                  isDense: true,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: users.length,
              itemBuilder:
                  (context, i) =>
                      _UserMessageTile(user: users[i], isDark: isDark),
            ),
          ),
        ],
      ),
    );
  }
}

class UserMsg {
  final String name, lastMsg, img, time;
  final int unread;
  final bool isNew;

  UserMsg({
    required this.name,
    required this.lastMsg,
    required this.time,
    required this.img,
    this.unread = 0,
    this.isNew = false,
  });
}

class _UserMessageTile extends StatelessWidget {
  final UserMsg user;

  const _UserMessageTile({required this.user, required this.isDark});

  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 6),
      margin: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          CircleAvatar(backgroundImage: NetworkImage(user.img), radius: 20),
          const SizedBox(width: 9),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      user.name,
                      style: AppTextStyles.subtitle16pxRegular(context),
                    ),

                    if (user.unread > 0)
                      Container(
                        margin: const EdgeInsetsDirectional.only(start: 6),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 7,
                          vertical: 0,
                        ),
                        decoration: BoxDecoration(
                          color:
                              isDark
                                  ? AppColors.darkModeButtonsPrimary
                                  : AppColors.lightModeButtonsPrimary,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          "${user.unread}",
                          style: AppTextStyles.subtitle16pxRegular(context),
                        ),
                      ),
                  ],
                ),
                Text(
                  user.lastMsg,
                  style: AppTextStyles.subtitle16pxRegular(context).copyWith(
                    color:
                        user.unread > 0
                            ? isDark
                                ? AppColors.white
                                : AppColors.black
                            : AppColors.graysGray2,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                user.time,
                style: AppTextStyles.text14pxRegular(
                  context,
                ).copyWith(color: AppColors.graysGray2),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
