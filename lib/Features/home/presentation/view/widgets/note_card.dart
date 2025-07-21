import 'package:book_apartment_dashboard/Features/home/presentation/view/widgets/section_title.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../generated/l10n.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({
    super.key,
    required this.context,
    required this.isDark,
    required this.note,
  });

  final BuildContext context;
  final bool isDark;
  final String? note;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(width: 1, color: AppColors.graysGray4),
        ),
        color:
        isDark
            ? AppColors.darkModeBackground
            : AppColors.lightModeBackground,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 16),
          child: Column(
            children: [
              SectionTitle(
                context: context,
                isDark: isDark,
                text: S.of(context).notes,
              ),
              Text(
                note ?? " لا يوجد ملاحظات",
                maxLines: 7,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.buttonLarge20pxRegular(context).copyWith(
                  color:
                  isDark
                      ? AppColors.darkModeButtonsPrimary
                      : AppColors.lightModeButtonsPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
