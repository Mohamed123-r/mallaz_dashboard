import 'package:book_apartment_dashboard/Features/add_new_properties/data/repo/add_new_properties_repo.dart';
import 'package:book_apartment_dashboard/Features/add_new_properties/data/repo/property_details_repo.dart';
import 'package:book_apartment_dashboard/Features/home/data/repo/status_home_repo.dart';
import 'package:book_apartment_dashboard/Features/home/presentation/cubit/appointment_cubit.dart';
import 'package:book_apartment_dashboard/Features/home/presentation/cubit/status_home_cubit.dart';
import 'package:book_apartment_dashboard/Features/main/widgets/custom_appbar.dart';
import 'package:book_apartment_dashboard/Features/main/widgets/custom_drawer.dart';
import 'package:book_apartment_dashboard/Features/main/widgets/drawer_item.dart';
import 'package:book_apartment_dashboard/Features/main/widgets/drawer_item_model.dart';
import 'package:book_apartment_dashboard/Features/notification/presentation/view/widgets/notification_view.dart';
import 'package:book_apartment_dashboard/Features/user_management/data/repo/user_repo.dart';
import 'package:book_apartment_dashboard/Features/user_management/presentation/cubit/user_cubit.dart';
import 'package:book_apartment_dashboard/Features/user_management/presentation/view/user_management.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import '../../core/helper_functions/get_it.dart';
import '../../generated/assets.dart';
import '../../generated/l10n.dart';
import '../add_new_properties/presentation/cubit/add_new_properties_cubit.dart';
import '../add_new_properties/presentation/cubit/property_details_cubit.dart';
import '../add_new_properties/presentation/view/requests_to_add_new_properties.dart';
import '../add_new_properties/presentation/view/requests_to_add_new_properties_deteils.dart';
import '../admin_management/data/repo/admin_repo.dart';
import '../admin_management/presentation/cubit/admin_cubit.dart';
import '../admin_management/presentation/view/admin_management_view.dart';
import '../chat/presentation/view/chat_view.dart';
import '../home/data/repo/appointment_repo.dart';
import '../home/presentation/view/home_view.dart';
import '../home/presentation/view/preview_requests_details_view.dart';
import '../unit_management/data/repo/property_repo.dart';
import '../unit_management/presentation/cubit/property_cubit.dart';
import '../unit_management/presentation/view/rent_to_lease_view.dart';
import '../unit_management/presentation/view/sales_view.dart';
import '../user_management/data/repo/user_search_repo.dart';
import '../user_management/presentation/cubit/user_search_cubit.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  static const String routeName = 'MainView';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  num activeIndex = 0.0;
  int propertyId = 1;

  @override
  Widget build(BuildContext context) {
    List<DrawerItemModel> drawerItems = [
      DrawerItemModel(
        title: S.of(context).homeScreen,
        image: Assets.imagesHomeIcon,
      ),
      DrawerItemModel(
        title: S.of(context).addRecuist,
        image: Assets.imagesMask,
      ),
      DrawerItemModel(
        title: S.of(context).manageSalesUnits,
        image: Assets.imagesWeuiHomeOutlined,
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
        title: S.of(context).adminManagement,
        image: Assets.imagesSeationgIcon,
      ),
      DrawerItemModel(
        title: S.of(context).provideSupport,
        image: Assets.imagesAskIcon,
      ),
      DrawerItemModel(
        title: S.of(context).sendNotification,
        image: Assets.imagesNotificationIcon,
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
                            ? MultiBlocProvider(
                              providers: [
                                BlocProvider(
                                  create:
                                      (context) => DashboardStatsCubit(
                                        getIt.get<DashboardStatsRepo>(),
                                      ),
                                ),
                                BlocProvider(
                                  create:
                                      (context) => AppointmentCubit(
                                        getIt.get<AppointmentRepo>(),
                                      ),
                                ),
                              ],
                              child: HomeView(
                                onTapSeeDetails: (id) {
                                  activeIndex = 0.1;
                                  propertyId = id;
                                  setState(() {});
                                },
                              ),
                            )
                            : activeIndex == 0.1
                            ? BlocProvider(
                              create:
                                  (_) => PropertyDetailsCubit(
                                    getIt.get<PropertyDetailsRepo>(),
                                  )..fetchPropertyDetails(propertyId),
                              child: PreviewRequestsDetailsView(
                                onTapBack: () {
                                  activeIndex = 0;
                                  setState(() {});
                                },

                              ),
                            )
                            : activeIndex == 1
                            ? BlocProvider(
                              create:
                                  (context) => PropertyRequestCubit(
                                    getIt.get<PropertyRequestRepo>(),
                                  ),
                              child: RequestsToAddNewProperties(
                                onTapSeeDetails: (int id) {
                                  propertyId = id;
                                  activeIndex = 1.1;
                                  setState(() {});
                                },
                              ),
                            )
                            : activeIndex == 1.1
                            ? BlocProvider(
                              create:
                                  (_) => PropertyDetailsCubit(
                                    getIt.get<PropertyDetailsRepo>(),
                                  )..fetchPropertyDetails(propertyId),
                              child: RequestsToAddNewPropertiesDetails(
                                onTapBack: () {
                                  activeIndex = 1;
                                  setState(() {});
                                },
                                propertyId: propertyId,
                              ),
                            )
                            : activeIndex == 2
                            ? BlocProvider(
                              create:
                                  (_) => PropertyCubit(
                                    propertyRepo: getIt.get<PropertyRepo>(),
                                  ),
                              child: SalesView(),
                            )
                            : activeIndex == 3
                            ? RentToLeaseView()
                            : activeIndex == 4
                            ? MultiBlocProvider(
                              providers: [
                                BlocProvider(
                                  create:
                                      (context) =>
                                          UserCubit(getIt.get<UserRepo>()),
                                ),
                                BlocProvider(
                                  create:
                                      (context) => UserSearchCubit(
                                        userSearchRepo:
                                            getIt.get<UserSearchRepo>(),
                                      ),
                                ),
                              ],
                              child: UserManagementView(
                                onPressedBack: () {
                                  activeIndex = 0;
                                  setState(() {});
                                  DelayStreamTransformer(
                                    const Duration(seconds: 1),
                                  );

                                  activeIndex = 4;

                                  setState(() {});
                                },
                              ),
                            )
                            : activeIndex == 5
                            ? BlocProvider(
                              create:
                                  (context) =>
                                      AdminCubit(getIt.get<AdminRepo>()),
                              child: AdminManagementView(),
                            )
                            : activeIndex == 6
                            ? ChatView()
                            : activeIndex == 7
                            ? NotificationView()
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
