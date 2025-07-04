
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class HomeItemBulider extends StatelessWidget {
  const HomeItemBulider({
    super.key,
    required this.isDark,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  final bool isDark;
  final String image;

  final String title;

  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 666,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(width: 1, color: AppColors.graysGray4),
        ),
        color:
        isDark ? AppColors.darkModeBackground : AppColors.lightModeBackground,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 8,
          children: [
            Image.asset(
              image,
              width: 64,
              color: isDark ? AppColors.darkModeText : AppColors.lightModeText,
            ),

            Text(title, style: AppTextStyles.style32pxW400(context)),
            Text(subTitle, style: AppTextStyles.subtitle16pxRegular(context)),
          ],
        ),
      ),
    );
  }
}
