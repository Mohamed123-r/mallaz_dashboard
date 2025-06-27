import 'package:book_apartment_dashboard/Features/main/widgets/custom_appbar.dart';
import 'package:book_apartment_dashboard/Features/main/widgets/custom_drawer.dart';
import 'package:book_apartment_dashboard/Features/main/widgets/drawer_item.dart';
import 'package:book_apartment_dashboard/Features/main/widgets/drawer_item_model.dart';
import 'package:flutter/material.dart';

import '../../generated/assets.dart';
import '../../generated/l10n.dart';
import '../home/presentation/view/home_view.dart';
import '../home/presentation/view/preview_requests_details_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  static const String routeName = 'MainView';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  num activeIndex = 0.0;

  @override
  Widget build(BuildContext context) {
    List<DrawerItemModel> drawerItems = [
      DrawerItemModel(
        title: S.of(context).homeScreen,
        image: Assets.imagesHomeIcon,
      ),
      DrawerItemModel(
        title: S.of(context).manageSalesUnits,
        image: Assets.imagesWeuiHomeOutlined,
      ),
      DrawerItemModel(
        title: S.of(context).managePartialRentUnits,
        image: Assets.imagesStreamlinePlumpHotelBed5,
      ),
      DrawerItemModel(
        title: S.of(context).manageFullRentUnits,
        image: Assets.imagesMaterialSymbolsLight,
      ),
      DrawerItemModel(
        title: S.of(context).manageUsers,
        image: Assets.imagesUsersIcon,
      ),
      DrawerItemModel(
        title: S.of(context).provideSupport,
        image: Assets.imagesAskIcon,
      ),
      DrawerItemModel(
        title: S.of(context).sendNotification,
        image: Assets.imagesNotificationIcon,
      ),
      DrawerItemModel(
        title: S.of(context).settings,
        image: Assets.imagesSeationgIcon,
      ),
      DrawerItemModel(
        title: S.of(context).logOut,
        image: Assets.imagesBasilLogoutOutline,
      ),
    ];
    return Scaffold(
      body: Column(
        children: [
          CustomAppbar(),
          Expanded(
            child: Row(
              children: [
                CustomDrawer(
                  drawerItems: drawerItems,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        if (activeIndex != index) {
                          activeIndex = index;
                          setState(() {});
                        }
                      },
                      child: DrawerItem(
                        drawerItemModel: drawerItems[index],
                        isActive: activeIndex == index,
                      ),
                    );
                  },
                ),
                Expanded(
                  child: Container(
                    child:
                        activeIndex == 0
                            ? HomeView(
                              onTapSeeDetails: () {
                                activeIndex = 0.1;
                                setState(() {});
                              },
                            )
                            : activeIndex == 0.1
                            ? PreviewRequestsDetailsView(
                              onTapBack: () {
                                activeIndex = 0;
                                setState(() {});
                              },
                            )
                            : Container(color: Colors.red),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
