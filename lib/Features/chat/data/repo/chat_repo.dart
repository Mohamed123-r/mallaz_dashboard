import '../models/chat_history_model.dart';
import '../models/chat_list_model.dart';
import '../models/send_message_model.dart';

abstract class ChatRepo {
  Future<Map<dynamic,dynamic>> getAllChats();
  Future<ChatHistoryModel> getChatHistory(String chatId);
  Future<SendMessageModel> sendMessage({
    required String receiverUserId,
    required String content,
  });
  Future<bool> deleteMessage(int messageId);
}