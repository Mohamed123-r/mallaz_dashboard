import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../services/locale_cubit.dart';
import '../services/theme_cubit.dart';
import 'app_colors.dart';

abstract class AppTextStyles {

  static TextStyle style40pxW700(BuildContext context) {
    String currentLanguage = context.watch<LocaleCubit>().state.languageCode;
    return TextStyle(
      fontSize: getResponsiveScaleFactor(context, fontSize:currentLanguage == "en" ? 34: 40),
      fontWeight: FontWeight.w700,

      color:
          context.watch<ThemeCubit>().state == ThemeMode.dark
              ? AppColors.darkModeAccent
              : AppColors.lightModeAccent,
    );
  }

  static TextStyle style32pxW400(BuildContext context) {
    String currentLanguage = context.watch<LocaleCubit>().state.languageCode;
    return TextStyle(
      fontSize: getResponsiveScaleFactor(context, fontSize: currentLanguage == "en" ? 28:32),
      fontWeight: FontWeight.w500,

      color:
          context.watch<ThemeCubit>().state == ThemeMode.dark
              ? AppColors.darkModeAccent
              : AppColors.lightModeAccent,
    );
  }

  static TextStyle subtitleTitle20pxRegular(BuildContext context) {
    String currentLanguage = context.watch<LocaleCubit>().state.languageCode;
    return TextStyle(
      fontSize: getResponsiveScaleFactor(context, fontSize:currentLanguage == "en" ? 18: 20),
      fontWeight: FontWeight.w500,

      color:
          context.watch<ThemeCubit>().state == ThemeMode.dark
              ? AppColors.darkModeText
              : AppColors.lightModeText,
    );
  }

  static TextStyle buttonLarge20pxRegular(BuildContext context) {
    String currentLanguage = context.watch<LocaleCubit>().state.languageCode;
    return TextStyle(
      fontSize: getResponsiveScaleFactor(context, fontSize:currentLanguage == "en" ? 16: 20),
      fontWeight: FontWeight.w500,
      color:
          context.watch<ThemeCubit>().state == ThemeMode.dark
              ? AppColors.darkModeText
              : AppColors.lightModeText,
    );
  }

  static TextStyle subtitle16pxRegular(BuildContext context) {
    String currentLanguage = context.watch<LocaleCubit>().state.languageCode;

    return TextStyle(
      fontSize: getResponsiveScaleFactor(context, fontSize:currentLanguage == "en" ? 14: 16),
      fontWeight: FontWeight.w500,
      color:
          context.watch<ThemeCubit>().state == ThemeMode.dark
              ? AppColors.darkModeText
              : AppColors.lightModeText,
    );
  }

  static TextStyle text14pxRegular(BuildContext context) {
    String currentLanguage = context.watch<LocaleCubit>().state.languageCode;
    return TextStyle(
      fontSize: getResponsiveScaleFactor(context, fontSize:currentLanguage == "en" ? 12: 14),
      fontWeight: FontWeight.w500,
      color:
          context.watch<ThemeCubit>().state == ThemeMode.dark
              ? AppColors.darkModeText
              : AppColors.lightModeText,
    );
  }

  static TextStyle text12pxLight(BuildContext context) {
    String currentLanguage = context.watch<LocaleCubit>().state.languageCode;
    return TextStyle(
      fontSize: getResponsiveScaleFactor(context, fontSize: currentLanguage == "en" ? 10:12),
      fontWeight: FontWeight.w400,
      color:
          context.watch<ThemeCubit>().state == ThemeMode.dark
              ? AppColors.darkModeText
              : AppColors.lightModeText,
    );
  }

  static TextStyle text10pxRegular(BuildContext context) {
    String currentLanguage = context.watch<LocaleCubit>().state.languageCode;
    return TextStyle(
      fontSize: getResponsiveScaleFactor(context, fontSize: currentLanguage == "en" ? 8:10),
      fontWeight: FontWeight.w500,
      color:
          context.watch<ThemeCubit>().state == ThemeMode.dark
              ? AppColors.darkModeText
              : AppColors.lightModeText,
    );
  }
}

double getResponsiveScaleFactor(
  BuildContext context, {
  required double fontSize,
}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = responsiveFontSize * 0.8;
  double upperLimit = responsiveFontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(BuildContext context) {
  double width = MediaQuery.of(context).size.width;

  if (width <= 600) {
    return width / 400;
  } else if (width <= 1200) {
    return width / 1000;
  } else {
    return width / 1450;
  }
}
