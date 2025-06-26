import 'package:book_apartment_dashboard/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/services/locale_cubit.dart';
import '../../../core/services/theme_cubit.dart';
import '../../../core/utils/app_text_styles.dart';
import 'drawer_item_model.dart';

class InActiveDrawerItem extends StatelessWidget {
  InActiveDrawerItem({super.key, required this.drawerItemModel});

  final DrawerItemModel drawerItemModel;

  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<ThemeCubit>().state == ThemeMode.dark;
    String currentLanguage = context.watch<LocaleCubit>().state.languageCode;

    return ListTile(

      leading: SvgPicture.asset(
        drawerItemModel.image,
        color:
            isDark
                ? AppColors.darkModeText
                : AppColors.lightModeButtonsSecondary,
      ),
      title: Text(
        drawerItemModel.title,
        style: AppTextStyles.subtitle16pxRegular(context).copyWith(
          color:
              isDark
                  ? AppColors.darkModeText
                  : AppColors.lightModeButtonsSecondary,
        ),
      ),
    );
  }
}

class ActiveDrawerItem extends StatelessWidget {
  const ActiveDrawerItem({super.key, required this.drawerItemModel});

  final DrawerItemModel drawerItemModel;

  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<ThemeCubit>().state == ThemeMode.dark;
    String currentLanguage = context.watch<LocaleCubit>().state.languageCode;

    return Container(
      decoration: BoxDecoration(
        color:
            isDark
                ? AppColors.darkModeButtonsPrimary
                : AppColors.lightModeButtonsPrimary,
        borderRadius: BorderRadius.only(
          topRight:
              currentLanguage == "en"
                  ? Radius.circular(500)
                  : Radius.circular(0),
          bottomRight:
              currentLanguage == "en"
                  ? Radius.circular(500)
                  : Radius.circular(0),
          topLeft:
              currentLanguage == "ar"
                  ? Radius.circular(500)
                  : Radius.circular(0),
          bottomLeft:
              currentLanguage == "ar"
                  ? Radius.circular(500)
                  : Radius.circular(0),
        ),
      ),
      child: ListTile(

        minLeadingWidth: 30,
        leading: SvgPicture.asset(drawerItemModel.image,
          color:
          isDark
              ? AppColors.darkModeBackground
              : AppColors.lightModeText,),
        title: Text(
          drawerItemModel.title,
          style: AppTextStyles.subtitle16pxRegular(context).copyWith(
            color:
            isDark
                ? AppColors.darkModeBackground
                : AppColors.lightModeText,
          ),
        ),
      ),
    );
  }
}
