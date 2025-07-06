import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class IconTextRow extends StatelessWidget {
  final BuildContext context;
  final bool isDark;
  final String asset;
  final String text;

  const IconTextRow({
    super.key,
    required this.context,
    required this.isDark,
    required this.asset,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          asset,
          width: 16,
          color:
          isDark
              ? AppColors.darkModeButtonsPrimary
              : AppColors.lightModeButtonsPrimary,
        ),
        const SizedBox(width: 8),
        Text(text, style: AppTextStyles.subtitle16pxRegular(context)),
      ],
    );
  }
}
