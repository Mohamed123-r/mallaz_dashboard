import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class UserMessageTile extends StatelessWidget {
  final Map<String, dynamic> user;
  final bool isDark;
  final bool isSelected;

  const UserMessageTile({
    super.key,
    required this.user,
    required this.isDark,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 6),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color:
            isSelected
                ? (isDark
                    ? AppColors.darkModeButtonsPrimary.withOpacity(0.15)
                    : AppColors.lightModeButtonsPrimary.withOpacity(0.15))
                : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage:
                user["userImage"] != null && user["userImage"]!.isNotEmpty
                    ? NetworkImage(user["userImage"]!)
                    : null,
            radius: 20,
            child:
                user["userImage"] == null ? Icon(Icons.person, size: 24) : null,
          ),
          const SizedBox(width: 9),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      user["userName"],
                      style: AppTextStyles.subtitle16pxRegular(context),
                    ),
                   user["unReaded"] == 0 || isSelected?
                      SizedBox() :
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
                          "${user["unReaded"]}",
                          style: AppTextStyles.subtitle16pxRegular(context),
                        ),
                      ),
                  ],
                ),
                Text(
                  user["lastMessage"],
                  style: AppTextStyles.subtitle16pxRegular(context).copyWith(
                    color:
                        user["unReaded"] > 0
                            ? isDark
                                ? AppColors.white
                                : AppColors.black
                            : AppColors.graysGray2,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 142,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  user["date"],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.text14pxRegular(
                    context,
                  ).copyWith(color: AppColors.graysGray2),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
