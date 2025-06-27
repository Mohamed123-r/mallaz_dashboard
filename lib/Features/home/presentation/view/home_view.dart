import 'package:book_apartment_dashboard/Features/home/presentation/view/widgets/data_analysis_section.dart';
import 'package:book_apartment_dashboard/Features/home/presentation/view/widgets/home_item_bulider.dart';
import 'package:book_apartment_dashboard/Features/home/presentation/view/widgets/table_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/services/locale_cubit.dart';
import '../../../../core/services/theme_cubit.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_text_styles.dart';
import '../../../../generated/assets.dart';
import '../../../../generated/l10n.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.onTapSeeDetails});
  final  VoidCallback onTapSeeDetails ;
  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<ThemeCubit>().state == ThemeMode.dark;
    String currentLanguage = context.watch<LocaleCubit>().state.languageCode;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DataAnalysisSection(isDark: isDark),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).pending,
                  style: AppTextStyles.subtitleTitle20pxRegular(
                    context,
                  ).copyWith(
                    color:
                        isDark
                            ? AppColors.darkModeButtonsPrimary
                            : AppColors.lightModeButtonsPrimary,
                  ),
                ),
                Text(
                  S.of(context).today ,
                  style: AppTextStyles.subtitleTitle20pxRegular(
                    context,
                  ).copyWith(
                    color:
                        isDark
                            ? AppColors.darkModeGrayText
                            : AppColors.lightModeGrayText,
                  ),
                ),
                TableSection(isDark: isDark, onTapSeeDetails: onTapSeeDetails ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

