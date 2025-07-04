import 'package:book_apartment_dashboard/Features/home/data/repo/status_home_repo.dart';
import 'package:book_apartment_dashboard/core/api/dio_consumer.dart';
import 'package:book_apartment_dashboard/core/api/end_point.dart';
import 'package:dio/dio.dart';

import '../models/status_home_model.dart';


class DashboardStatsRepoImpl implements DashboardStatsRepo {
  final DioConsumer dioConsumer;
  DashboardStatsRepoImpl({required this.dioConsumer});

  @override
  Future<Map<String ,dynamic>> getDashboardStats() async {
    final response = await dioConsumer.get(EndPoint.getDashboardStats);
    return response;
  }
}