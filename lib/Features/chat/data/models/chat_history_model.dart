class ChatMessageItem {
  final int id;
  final String createdAt;
  final String senderUserId;
  final String receiverUserId;
  final String content;
  final bool isRead;
  final int chatId;

  ChatMessageItem({
    required this.id,
    required this.createdAt,
    required this.senderUserId,
    required this.receiverUserId,
    required this.content,
    required this.isRead,
    required this.chatId,
  });

  factory ChatMessageItem.fromJson(Map<String, dynamic> json) {
    return ChatMessageItem(
      id: json['id'],
      createdAt: json['createdAt'],
      senderUserId: json['senderUserId'],
      receiverUserId: json['receiverUserId'],
      content: json['content'],
      isRead: json['isRead'],
      chatId: json['chatId'],
    );
  }
}

class ChatHistoryModel {
  final bool success;
  final String message;
  final List<ChatMessageItem> data;

  ChatHistoryModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory ChatHistoryModel.fromJson(Map<String, dynamic> json) {
    return ChatHistoryModel(
      success: json['success'],
      message: json['message'],
      data: (json['data'] as List)
          .map((e) => ChatMessageItem.fromJson(e))
          .toList(),
    );
  }
}