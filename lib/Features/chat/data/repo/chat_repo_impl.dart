import 'package:dio/dio.dart';
import '../../../../constant.dart';
import '../../../../core/api/dio_consumer.dart';
import '../models/chat_history_model.dart';
import '../models/chat_list_model.dart';
import '../models/send_message_model.dart';
import 'chat_repo.dart';

class ChatRepoImpl implements ChatRepo {
  final DioConsumer dioConsumer;
  ChatRepoImpl({required this.dioConsumer});

  @override
  Future<Map<dynamic,dynamic>> getAllChats() async {
    final res = await dioConsumer.get("/api/ChatMassage/GetAllChats");

    return res;

  }

  @override
  Future<ChatHistoryModel> getChatHistory(String chatId) async {
    final res = await dioConsumer.get(
      "/api/ChatMassage/history/$chatId",
    );
    return ChatHistoryModel.fromJson(res.data);
  }

  @override
  Future<SendMessageModel> sendMessage({required String receiverUserId, required String content, }) async {
    final res = await dioConsumer.post(
      "http://realestateunits.runasp.net/api/ChatMassage",
      data: {
        "receiverUserId": receiverUserId,
        "content": content,
      },
    );
    return SendMessageModel.fromJson(res.data);
  }

  @override
  Future<bool> deleteMessage(int messageId) async {
    final res = await dioConsumer.delete("http://realestateunits.runasp.net/api/ChatMassage/$messageId");
    return res.data['success'] == true;
  }
}