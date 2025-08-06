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
  Future<Map<dynamic, dynamic>> getAllChats() async {
    final res = await dioConsumer.get("/api/ChatMassage/GetAllChats");

    return res;
  }

  @override
  Future<Map<dynamic, dynamic>> getChatHistory(String chatId) async {
    final res = await dioConsumer.get("/api/ChatMassage/history/$chatId");
    return res;
  }

  @override
  Future<Map<dynamic, dynamic>> sendMessage({
    required String receiverUserId,
    required String content,
  }) async {
    final res = await dioConsumer.post(
      "http://realestateunits.runasp.net/api/ChatMassage",
      data: {"receiverUserId": receiverUserId, "content": content},
    );
    return res;
  }


  @override
  Future<Map<dynamic, dynamic>> deleteSpecificMessage(int messageId) async {
    final res = await dioConsumer.delete(
      "http://realestateunits.runasp.net/api/ChatMassage/$messageId",
    );
    return res;
  }

  // API جديدة: جعل كل الرسائل مقروءة
  @override
  Future<Map<dynamic, dynamic>> markAllMessagesRead(String chatId) async {
    final res = await dioConsumer.put(
      "http://realestateunits.runasp.net/api/ChatMassage/MakeAllMassageRead?ChatId=$chatId",
    );
    return res;
  }
}
