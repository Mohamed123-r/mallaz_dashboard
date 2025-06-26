import 'package:book_apartment_dashboard/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/services/locale_cubit.dart';
import '../../../core/services/theme_cubit.dart';
import '../../../core/utils/app_text_styles.dart';
import '../../../generated/assets.dart';

import 'drawer_item_list_view.dart';
import 'drawer_item_model.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({
    super.key,
    required this.drawerItems,
    required this.itemBuilder,
  });

  final NullableIndexedWidgetBuilder itemBuilder;

  final List<DrawerItemModel> drawerItems;

  @override
  Widget build(BuildContext context) {
    bool isDark = context.watch<ThemeCubit>().state == ThemeMode.dark;
    String currentLanguage = context.watch<LocaleCubit>().state.languageCode;

    var width = MediaQuery.of(context).size.width * (300 / 1250);
    return Container(
      width: width,
      decoration: BoxDecoration(
        color:
            isDark ? AppColors.darkModeBackground : AppColors.lightModeAccent,

      ),
      child: Row(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: SizedBox(height: 12)),
                DrawerItemListView(
                  drawerItems: drawerItems,
                  itemBuilder: itemBuilder,
                ),
              ],
            ),
          ),
          Container(
            height: double.infinity,
            width: 1,
            color: Color(0xff484849),
          ),
        ],
      ),
    );
  }
}
