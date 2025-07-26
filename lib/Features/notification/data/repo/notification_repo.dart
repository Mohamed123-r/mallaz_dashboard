import '../../data/models/notification_model.dart';

abstract class NotificationRepo {
  Future<bool> sendNotification(String title, String description);

  Future<Map<String, dynamic>> fetchNotifications({
   required int pageNumber,
    required int pageSize,
  });
}
