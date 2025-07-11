import 'package:book_apartment_dashboard/Features/login/presentation/view/log_in_view.dart';
import 'package:book_apartment_dashboard/Features/main/widgets/drawer_item.dart';
import 'package:book_apartment_dashboard/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constant.dart';
import '../../../core/database/cache/cache_helper.dart';
import '../../../core/services/locale_cubit.dart';
import '../../../core/services/theme_cubit.dart';
import '../../../core/utils/app_text_styles.dart';
import '../../../generated/assets.dart';

import '../../../generated/l10n.dart';
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
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: [
                      Expanded(child: SizedBox()),
                      Container(
                        height: 1,
                        width: double.infinity,
                        color: AppColors.graysGray4,
                      ),
                      InkWell(
                        borderRadius: BorderRadius.circular(32),
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(S.of(context).logOut),
                                content: Text(
                               S.of(context).logoutQua   ,
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(S.of(context).cancel,
                                    style: AppTextStyles.buttonLarge20pxRegular(
                                      context,
                                    ).copyWith(
                                      color: AppColors.red,
                                    ),
                              ),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      CacheHelper().saveMap(
                                        key: userData,
                                        value: {},
                                      );

                                      CacheHelper.sharedPreferences.setBool(
                                        isSuccessLogin,
                                        false,
                                      );

                                      Navigator.of(context).pushReplacement(
                                        MaterialPageRoute(
                                          builder: (context) => LogInView(),
                                        ),
                                      );
                                    },
                                    child: Text(S.of(context).confirm,
                                    style: AppTextStyles.buttonLarge20pxRegular(
                                      context,
                                    ).copyWith(
                                      color: AppColors.green,
                                    ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },

                        child: DrawerItem(
                          drawerItemModel: DrawerItemModel(
                            title: S.of(context).logOut,
                            image: Assets.imagesBasilLogoutOutline,
                          ),
                          isActive: false,
                        ),
                      ),
                      SizedBox(height: 24),
                    ],
                  ),
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
