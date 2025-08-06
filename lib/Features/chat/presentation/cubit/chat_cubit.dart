import 'package:book_apartment_dashboard/constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/chat_history_model.dart';
import '../../data/models/chat_list_model.dart';
import '../../data/repo/chat_repo.dart';
import 'chat_state.dart';
 String id  = "";
class ChatCubit extends Cubit<ChatState> {
  final ChatRepo repo;
  // إضافة متغير لتخزين معرف المستخدم المستلم

  ChatCubit(this.repo) : super(ChatInitial());

  Future<void> fetchChatHistory(String receiverUserId) async {
    emit(ChatHistoryLoading());
  // تحديث معرف المستخدم المستلم
    try {
      final res = await repo.getChatHistory(receiverUserId);
      logger.i('Fetched Chat History for chatId $receiverUserId: ${res}');
      if (res["data"] == null || res["data"].isEmpty) {
        logger.w('No data returned for chatId $receiverUserId');
      };
        id = receiverUserId;
      emit(ChatHistoryLoaded(res["data"] ?? []));
    } catch (e) {
      logger.e('Error fetching chat history: $e');
      emit(ChatHistoryFailure(e.toString()));
    }
  }

  Future<void> sendMessage({
    required String receiverUserId,
    required String content,
  }) async {
    try {
      final res = await repo.sendMessage(
        receiverUserId: receiverUserId,
        content: content,
      );
      logger.i('Send Message Response: $res');
      if (res["success"] && res["data"] != null) {
        emit(ChatSendSuccess(res["data"]));
        await fetchChatHistory(receiverUserId); // تحديث الـ history
      } else {
        emit(ChatSendFailure(res["message"] ?? "Failed to send message"));
      }
    } catch (e) {
      logger.e('Error sending message: $e');
      emit(ChatSendFailure(e.toString()));
    }
  }



  Future<void> deleteSpecificMessage(int messageId) async {
    emit(ChatHistoryLoading());
    try {
      final res = await repo.deleteSpecificMessage(messageId);
    if (res["success"]) {
        emit(ChatDeleteSuccess());

        await fetchChatHistory(id);

      } else {
        emit(ChatDeleteFailure(res["message"] ?? "Failed to delete message"));
      }
    } catch (e) {
      logger.e('Error deleting specific message: $e');
      emit(ChatDeleteFailure(e.toString()));
    }
  }
  // دالة جديدة: جعل كل الرسائل مقروءة
  Future<void> markAllMessagesRead(String chatId) async {
    emit(ChatHistoryLoading());
    try {
      final res = await repo.markAllMessagesRead(chatId);
      if (res["success"]) {
        FetchChatsCubit(
          repo,
        ).fetchChats();

        await fetchChatHistory(id);


      } else {
   }
    } catch (e) {
      logger.e('Error marking all messages read: $e');

    }
  }
}

class FetchChatsCubit extends Cubit<ChatState> {
  final ChatRepo repo;

  FetchChatsCubit(this.repo) : super(ChatInitial());

  Future<void> fetchChats() async {
    emit(ChatListLoading());
    try {
      final res = await repo.getAllChats();
      logger.i('Fetched Chats: ${res}');
      emit(ChatListLoaded(res['data']));
    } catch (e) {
      logger.e('Error fetching chats: $e');
      emit(ChatListFailure(e.toString()));
    }
  }
}