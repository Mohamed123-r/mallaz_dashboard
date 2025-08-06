class ChatListItem {
  final int chatId;
  final String senderId;
  final String lastMessage;
  final int unreadRead;
  final String userName;
  final String? userImage;
  final String date;

  ChatListItem({
    required this.chatId,
    required this.senderId,
    required this.lastMessage,
    required this.unreadRead,
    required this.userName,
    required this.userImage,
    required this.date,
  });

  factory ChatListItem.fromJson(Map<String, dynamic> json) {
    return ChatListItem(
      chatId: json['chatId'],
      senderId: json['senderId'],
      lastMessage: json['lastMessage'],
      unreadRead: json['unreadRead'],
      userName: json['userName'],
      userImage: json['userImage'],
      date: json['date'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'chatId': chatId,
      'senderId': senderId,
      'lastMessage': lastMessage,
      'unreadRead': unreadRead,
      'userName': userName,
      'userImage': userImage,
      'date': date,
    };
  }
}

class ChatListModel {
  final bool success;
  final String message;
  final List<ChatListItem> data;

  ChatListModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory ChatListModel.fromJson(Map<String, dynamic> json) {
    return ChatListModel(
      success: json['success'],
      message: json['message'],
      data:
          (json['data'] as List).map((e) => ChatListItem.fromJson(e)).toList(),
    );
  }
}
