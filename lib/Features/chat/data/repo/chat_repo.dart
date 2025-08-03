import '../models/chat_history_model.dart';
import '../models/chat_list_model.dart';
import '../models/send_message_model.dart';

abstract class ChatRepo {
  Future<Map<dynamic,dynamic>> getAllChats();
  Future<Map<dynamic,dynamic>> getChatHistory(String chatId);
  Future<Map<dynamic,dynamic>> sendMessage({
    required String receiverUserId,
    required String content,
  });
  Future<bool> deleteMessage(int messageId);
}