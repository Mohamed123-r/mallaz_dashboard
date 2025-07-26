class NotificationItem {
  final int id;
  final String title;
  final String description;
  final String createdAt;

  NotificationItem({
    required this.id,
    required this.title,
    required this.description,
    required this.createdAt,
  });

  factory NotificationItem.fromJson(Map<String, dynamic> json) {
    return NotificationItem(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      createdAt: json['createdAt'],
    );
  }
}

class NotificationModel {
  final bool success;
  final String message;
  final List<NotificationItem> data;
  final int totalCount;
  final int pageNumber;
  final int pageSize;
  final int totalPage;

  NotificationModel({
    required this.success,
    required this.message,
    required this.data,
    required this.totalCount,
    required this.pageNumber,
    required this.pageSize,
    required this.totalPage,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      success: json['success'] ?? false,
      message: json['message'] ?? "",
      data: (json['data'] as List)
          .map((e) => NotificationItem.fromJson(e))
          .toList(),
      totalCount: json['totalCount'],
      pageNumber: json['pageNumber'],
      pageSize: json['pageSize'],
      totalPage: json['totalPage'],
    );
  }
}