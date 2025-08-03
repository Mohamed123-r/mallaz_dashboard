import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/chat_history_model.dart';
import '../../data/models/chat_list_model.dart';
import '../../data/repo/chat_repo.dart';


// States
abstract class ChatState {}

class ChatInitial extends ChatState {}
class ChatListLoading extends ChatState {}
class ChatListLoaded extends ChatState {
  final List<dynamic> chats;
  ChatListLoaded(this.chats);
}
class ChatListFailure extends ChatState {
  final String error;
  ChatListFailure(this.error);
}

class ChatHistoryLoaded extends ChatState {
  final List<dynamic> data;
  ChatHistoryLoaded(this.data);
}
class ChatHistoryLoading extends ChatState {}
class ChatHistoryFailure extends ChatState {
  final String error;
  ChatHistoryFailure(this.error);
}

class ChatSendSuccess extends ChatState {
  final dynamic message;
  ChatSendSuccess(this.message);
}
class ChatSendFailure extends ChatState {
  final String error;
  ChatSendFailure(this.error);
}
class ChatSendLoading extends ChatState {}
class ChatDeleteSuccess extends ChatState {}
class ChatDeleteFailure extends ChatState {
  final String error;
  ChatDeleteFailure(this.error);
}
class ChatDeleteLoading extends ChatState {}
