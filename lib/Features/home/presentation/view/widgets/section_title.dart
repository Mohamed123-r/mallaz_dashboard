import 'package:flutter/cupertino.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.context,
    required this.isDark,
    required this.text,
  });

  final BuildContext context;
  final bool isDark;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTextStyles.buttonLarge20pxRegular(context).copyWith(
        color:
        isDark
            ? AppColors.darkModeButtonsPrimary
            : AppColors.lightModeButtonsPrimary,
      ),
    );
  }
}
