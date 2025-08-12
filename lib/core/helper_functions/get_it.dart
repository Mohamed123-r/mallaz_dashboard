import 'package:book_apartment_dashboard/Features/add_new_properties/data/repo/add_new_properties_repo.dart';
import 'package:book_apartment_dashboard/Features/add_new_properties/data/repo/add_new_properties_repo_impl.dart';
import 'package:book_apartment_dashboard/Features/add_new_properties/data/repo/property_details_repo.dart';
import 'package:book_apartment_dashboard/Features/add_new_properties/data/repo/property_details_repo_impl.dart';
import 'package:book_apartment_dashboard/Features/home/data/repo/appointment_repo_impl.dart';
import 'package:book_apartment_dashboard/Features/home/data/repo/status_home_repo.dart';
import 'package:book_apartment_dashboard/Features/home/data/repo/status_home_repo_impl.dart';
import 'package:book_apartment_dashboard/Features/user_management/data/repo/user_repo.dart';
import 'package:book_apartment_dashboard/Features/user_management/data/repo/user_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../Features/admin_management/data/repo/add_admin_repo.dart';
import '../../Features/admin_management/data/repo/add_admin_repo_impl.dart';
import '../../Features/admin_management/data/repo/admin_repo.dart';
import '../../Features/admin_management/data/repo/admin_repo_impl.dart';
import '../../Features/chat/data/repo/chat_repo.dart';
import '../../Features/chat/data/repo/chat_repo_impl.dart';
import '../../Features/home/data/repo/appointment_repo.dart';
import '../../Features/notification/data/repo/notification_repo.dart';
import '../../Features/notification/data/repo/notification_repo_impl.dart';
import '../../Features/unit_management/data/repo/property_repo.dart';
import '../../Features/unit_management/data/repo/property_repo_impl.dart';
import '../../Features/user_management/data/repo/user_search_repo.dart';
import '../../Features/user_management/data/repo/user_search_repo_impl.dart';
import '../api/dio_consumer.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<DioConsumer>(DioConsumer(dio: Dio()));
  getIt.registerSingleton<UserRepo>(
    UserRepoImpl(dioConsumer: getIt<DioConsumer>()),
  );
  getIt.registerSingleton<AdminRepo>(
    AdminRepoImpl(dioConsumer: getIt<DioConsumer>()),
  ); getIt.registerSingleton<AddAdminRepo>(
    AddAdminRepoImpl(dioConsumer: getIt<DioConsumer>()),
  );
  getIt.registerSingleton<DashboardStatsRepo>(
    DashboardStatsRepoImpl(dioConsumer: getIt<DioConsumer>()),
  );
  getIt.registerSingleton<NotificationRepo>(
    NotificationRepoImpl(dioConsumer: getIt<DioConsumer>()),
  );
  getIt.registerSingleton<AppointmentRepo>(
    AppointmentRepoImpl(dioConsumer: getIt<DioConsumer>()),
  );
  getIt.registerSingleton<PropertyRequestRepo>(
    PropertyRequestRepoImpl(dioConsumer: getIt<DioConsumer>()),
  );
  getIt.registerSingleton<PropertyDetailsRepo>(
    PropertyDetailsRepoImpl(dioConsumer: getIt<DioConsumer>()),
  );
  getIt.registerSingleton<UserSearchRepo>(
    UserSearchRepoImpl(dioConsumer: getIt<DioConsumer>()),
  );
  getIt.registerSingleton<PropertyRepo>(
    PropertyRepoImpl(dioConsumer: getIt<DioConsumer>()),
  );
  getIt.registerSingleton<ChatRepo>(
    ChatRepoImpl(dioConsumer: getIt<DioConsumer>()),
  );
}
