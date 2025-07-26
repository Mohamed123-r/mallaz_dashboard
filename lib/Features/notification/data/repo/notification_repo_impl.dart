import 'package:book_apartment_dashboard/core/api/dio_consumer.dart';
import 'package:dio/dio.dart';

import '../models/notification_model.dart';
import 'notification_repo.dart';

class NotificationRepoImpl implements NotificationRepo {
  final DioConsumer dioConsumer;

  NotificationRepoImpl({required this.dioConsumer});

  @override
  Future<bool> sendNotification(String title, String description) async {
    try {
      final response = await dioConsumer.post(
        "/api/Notification",
        data: {"title": title, "description": description},
      );
      return  true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<Map<String, dynamic>> fetchNotifications({
    required int pageNumber,
    required int pageSize,
  }) async {
    try {
      final response = await dioConsumer.get(
        "/api/Notification?PageNumber=$pageNumber&PageSize=$pageSize",
      );
      return response ;

  } catch (e) {
  throw Exception("Failed to fetch notifications: $e");
    }
  }
}
