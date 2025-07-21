import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/services/theme_cubit.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({
    super.key,
    required this.context,
    required this.isDark,
    required this.name,
    required this.phone,
    required this.image,
  });

  final BuildContext context;
  final bool isDark;
  final String name;
  final String phone;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(width: 1, color: AppColors.graysGray4),
      ),
      color:
      isDark ? AppColors.darkModeBackground : AppColors.lightModeBackground,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 35,
              backgroundColor:
              isDark
                  ? AppColors.darkModeButtonsPrimary
                  : AppColors.lightModeButtonsPrimary,
              child:
              image != null
                  ? Image.network(image!, fit: BoxFit.cover)
                  : Icon(
                Icons.person,
                size: 32,
                color:
                context.watch<ThemeCubit>().state == ThemeMode.dark
                    ? AppColors.darkModeText
                    : AppColors.lightModeText,
              ),
            ),
            const SizedBox(height: 4),
            Text(name, style: AppTextStyles.text14pxRegular(context)),
            const SizedBox(height: 4),
            Text(phone, style: AppTextStyles.text14pxRegular(context)),
          ],
        ),
      ),
    );
  }
}
