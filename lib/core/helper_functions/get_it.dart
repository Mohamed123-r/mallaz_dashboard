import 'package:book_apartment_dashboard/Features/add_new_properties/data/repo/add_new_properties_repo.dart';
import 'package:book_apartment_dashboard/Features/add_new_properties/data/repo/add_new_properties_repo_impl.dart';
import 'package:book_apartment_dashboard/Features/add_new_properties/data/repo/property_details_repo.dart';
import 'package:book_apartment_dashboard/Features/add_new_properties/data/repo/property_details_repo_impl.dart';
import 'package:book_apartment_dashboard/Features/home/data/repo/status_home_repo.dart';
import 'package:book_apartment_dashboard/Features/home/data/repo/status_home_repo_impl.dart';
import 'package:book_apartment_dashboard/Features/seating/data/repo/admin_repo.dart';
import 'package:book_apartment_dashboard/Features/user_management/data/repo/user_repo.dart';
import 'package:book_apartment_dashboard/Features/user_management/data/repo/user_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../Features/seating/data/repo/admin_repo_impl.dart';
import '../api/dio_consumer.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<DioConsumer>(DioConsumer(dio: Dio()));
  getIt.registerSingleton<UserRepo>(
    UserRepoImpl(dioConsumer: getIt<DioConsumer>()),
  );
  getIt.registerSingleton<AdminRepo>(
    AdminRepoImpl(dioConsumer: getIt<DioConsumer>()),
  );
  getIt.registerSingleton<DashboardStatsRepo>(
    DashboardStatsRepoImpl(dioConsumer: getIt<DioConsumer>()),
  );
  getIt.registerSingleton<PropertyRequestRepo>(
    PropertyRequestRepoImpl(dioConsumer: getIt<DioConsumer>()),
  );  getIt.registerSingleton<PropertyDetailsRepo>(
    PropertyDetailsRepoImpl(dioConsumer: getIt<DioConsumer>()),
  );
}
