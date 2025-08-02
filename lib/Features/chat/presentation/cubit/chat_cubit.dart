import 'package:book_apartment_dashboard/constant.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/chat_history_model.dart';
import '../../data/models/chat_list_model.dart';
import '../../data/repo/chat_repo.dart';
import 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatRepo repo;

  ChatCubit(this.repo) : super(ChatInitial());

  Future<void> fetchChats() async {
    emit(ChatListLoading());
    try {
      final res = await repo.getAllChats();
      logger.i('Fetched Chats: ${res}');
      emit(
        ChatListLoaded(
          res['data']

        ),
      );
    } catch (e) {
      emit(ChatListFailure(e.toString()));
    }
  }

  Future<void> fetchChatHistory(String chatId) async {
    emit(ChatHistoryLoading());
    try {
      final res = await repo.getChatHistory(chatId);
      emit(ChatHistoryLoaded(res.data));
    } catch (e) {
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
      if (res.success && res.data != null) {
        emit(ChatSendSuccess(res.data!));
      } else {
        emit(ChatSendFailure(res.message));
      }
    } catch (e) {
      emit(ChatSendFailure(e.toString()));
    }
  }

  Future<void> deleteMessage(int messageId) async {
    try {
      final success = await repo.deleteMessage(messageId);
      if (success) {
        emit(ChatDeleteSuccess());
      } else {
        emit(ChatDeleteFailure("Failed to delete message"));
      }
    } catch (e) {
      emit(ChatDeleteFailure(e.toString()));
    }
  }
}
