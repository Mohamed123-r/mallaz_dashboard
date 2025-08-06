import 'chat_history_model.dart';

class SendMessageModel {
  final bool success;
  final String message;
  final ChatMessageItem? data;

  SendMessageModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory SendMessageModel.fromJson(Map<String, dynamic> json) {
    return SendMessageModel(
      success: json['success'],
      message: json['message'],
      data:
          json['data'] != null ? ChatMessageItem.fromJson(json['data']) : null,
    );
  }
}
