import 'package:book_apartment_dashboard/Features/main/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

import '../../generated/assets.dart';
import 'widgets/custom_drawer.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});
  static const String routeName = 'MainView';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  num activeIndex = 0.0;
  // final List<DrawerItemModel> drawerItems = [
  //   DrawerItemModel(title: 'الصفحة الرئيسية', image: Assets.imagesHouse),
  //   DrawerItemModel(title: 'إدارة سير العمل', image: Assets.imagesUser),
  //   DrawerItemModel(title: 'الشكاوي', image: Assets.imagesHeadset),
  //   DrawerItemModel(
  //       title: 'التسويات المالية', image: Assets.imagesCurrencyDollar),
  //   DrawerItemModel(title: 'الإعلانات', image: Assets.imagesPaintBrush),
  //   DrawerItemModel(title: 'التقارير', image: Assets.imagesReports),
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // CustomDrawer(
          //   drawerItems: drawerItems,
          //   itemBuilder: (context, index) {
          //     return GestureDetector(
          //       onTap: () {
          //         if (activeIndex != index) {
          //           activeIndex = index;
          //           setState(() {});
          //         }
          //       },
          //       child: DrawerItem(
          //         drawerItemModel: drawerItems[index],
          //         isActive: activeIndex == index,
          //       ),
          //     );
          //   },
          // ),
          Expanded(
            child: Column(
              children: [
                CustomAppbar(title: '',

                )
                      // Expanded(
                //     child: activeIndex == 0
                //         ? HomeView()
                //         : activeIndex == 1
                //             ? ManageWorkProcessFromWorkflowView(
                //                 onTapCountry: () {
                //                   activeIndex = activeIndex + 0.1;
                //                   setState(() {});
                //                 },
                //               )
                //             : activeIndex == 1.1
                //                 ? ManageWorkProcessDetailsFromWorkflowView(
                //                     onPressedBack: () {
                //                       activeIndex = activeIndex - 0.1;
                //                       setState(() {});
                //                     },
                //                     onTapItem1: () {
                //                       activeIndex = 1.2;
                //                       setState(() {});
                //                     },
                //                     onTapItem2: () {
                //                       activeIndex = 1.3;
                //                       setState(() {});
                //                     },
                //                     onTapItem3: () {
                //                       activeIndex = 1.4;
                //                       setState(() {});
                //                     },
                //                     onTapItem4: () {
                //                       activeIndex = 1.5;
                //                       setState(() {});
                //                     },
                //                     onTapItem5: () {
                //                       activeIndex = 1.6;
                //                       setState(() {});
                //                     },
                //                     onTapItem6: () {
                //                       activeIndex = 1.7;
                //                       setState(() {});
                //                     },
                //                   )
                //                 : activeIndex == 1.2
                //                     ? ClientsView(
                //                         onPressedBack: () {
                //                           activeIndex = 1.1;
                //                           setState(() {});
                //                         },
                //                       )
                //                     : activeIndex == 1.3
                //                         ? ManageDriversView(
                //                             onPressedBack: () {
                //                               activeIndex = 1.1;
                //                               setState(() {});
                //                             },
                //                             onTapItem1: () {
                //                               activeIndex = 1.31;
                //                               setState(() {});
                //                             },
                //                             onTapItem2: () {
                //                               activeIndex = 1.32;
                //                               setState(() {});
                //                             },
                //                           )
                //                         : activeIndex == 1.31
                //                             ? DriversView(
                //                                 onPressedBack: () {
                //                                   activeIndex = 1.3;
                //                                   setState(() {});
                //                                 },
                //                               )
                //                             : activeIndex == 1.32
                //                                 ? DriversBlockedView(
                //                                     onPressedBack: () {
                //                                       activeIndex = 1.3;
                //                                       setState(() {});
                //                                     },
                //                                   )
                //                                 : activeIndex == 1.4
                //                                     ? DriversRequestsView(
                //                                         onPressedBack: () {
                //                                           activeIndex = 1.1;
                //                                           setState(() {});
                //                                         },
                //                                       )
                //                                     : activeIndex == 1.5
                //                                         ? OrderView(
                //                                             onPressedBack:
                //                                                 () {
                //                                               activeIndex =
                //                                                   1.1;
                //                                               setState(() {});
                //                                             },
                //                                             onTapItem: () {
                //                                               activeIndex =
                //                                                   1.51;
                //                                               setState(() {});
                //                                             },
                //                                           )
                //                                         : activeIndex == 1.51
                //                                             ? OrderDetailsView(
                //                                                 onPressedBack:
                //                                                     () {
                //                                                   activeIndex =
                //                                                       1.5;
                //                                                   setState(
                //                                                       () {});
                //                                                 },
                //                                               )
                //                                             : activeIndex ==
                //                                                     1.6
                //                                                 ? ShowExsistedAreasView(
                //                                                     onPressedBack:
                //                                                         () {
                //                                                       activeIndex =
                //                                                           1.1;
                //                                                       setState(
                //                                                           () {});
                //                                                     },
                //                                                   )
                //                                                 : activeIndex ==
                //                                                         1.7
                //                                                     ? AddNewAreaView(
                //                                                         onPressedBack:
                //                                                             () {
                //                                                           activeIndex =
                //                                                               1.1;
                //                                                           setState(() {});
                //                                                         },
                //                                                       )
                //                                                     : activeIndex ==
                //                                                             2
                //                                                         ? ManageWorkProcessFromComplaintsView(
                //                                                             onTapCountry: () {
                //                                                               activeIndex = 2.1;
                //                                                               setState(() {});
                //                                                             },
                //                                                           )
                //                                                         : activeIndex == 2.1
                //                                                             ? ComplaintsView(
                //                                                                 onPressedBack: () {
                //                                                                   activeIndex = 2;
                //                                                                   setState(() {});
                //                                                                 },
                //                                                               )
                //                                                             : activeIndex == 3
                //                                                                 ? ManageWorkProcessFromFinancialView(
                //                                                                     onTapCountry: () {
                //                                                                       activeIndex = 3.1;
                //                                                                       setState(() {});
                //                                                                     },
                //                                                                   )
                //                                                                 : activeIndex == 3.1
                //                                                                     ? FinancialView(
                //                                                                         onPressedBack: () {
                //                                                                           activeIndex = 3;
                //                                                                           setState(() {});
                //                                                                         },
                //                                                                       )
                //                                                                     : activeIndex == 4
                //                                                                         ? AdvertisingView()
                //                                                                         : activeIndex == 5
                //                                                                             ? ManageWorkProcessFromReportsView(
                //                                                                                 onTapCountry: () {
                //                                                                                   activeIndex = 5.1;
                //                                                                                   setState(() {});
                //                                                                                 },
                //                                                                               )
                //                                                                             : activeIndex == 5.1
                //                                                                                 ? ManageReportsView(
                //                                                                                     onTapItem1: () {
                //                                                                                       activeIndex = 5.11;
                //                                                                                       setState(() {});
                //                                                                                     },
                //                                                                                     onTapItem2: () {
                //                                                                                       activeIndex = 5.12;
                //                                                                                       setState(() {});
                //                                                                                     },
                //                                                                                     onPressedBack: () {
                //                                                                                       activeIndex = 5;
                //                                                                                       setState(() {});
                //                                                                                     },
                //                                                                                   )
                //                                                                                 : activeIndex == 5.11
                //                                                                                     ? ReportsView(
                //                                                                                         onPressedBack: () {
                //                                                                                           activeIndex = 5.1;
                //                                                                                           setState(() {});
                //                                                                                         },
                //                                                                                       )
                //                                                                                     : activeIndex == 5.12
                //                                                                                         ? ReportsFinancialView(
                //                                                                                             onPressedBack: () {
                //                                                                                               activeIndex = 5.1;
                //                                                                                               setState(() {});
                //                                                                                             },
                //                                                                                           )
                //                                                                                         : Container()),
              ],
            ),
          )
        ],
      ),
    );
  }
}
