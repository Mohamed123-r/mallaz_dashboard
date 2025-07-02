import 'package:book_apartment_dashboard/Features/user_management/data/models/lock_unlock_model.dart';
import '../../data/models/User_model.dart';

abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserSuccess extends UserState {
  final UserModel users;
  UserSuccess(this.users);
}

class UserFailure extends UserState {
  final String error;
  UserFailure(this.error);
}
class UserBlockOperationInProgress extends UserState {
  final String userId;
  final bool isLock; // true = حظر، false = إلغاء حظر
  UserBlockOperationInProgress({required this.userId, required this.isLock});
}
class UserBlockOperationSuccess extends UserState {
  final String userId;
  final bool isLock;
  final String message;
  UserBlockOperationSuccess({required this.userId, required this.isLock, required this.message});
}
class UserBlockOperationError extends UserState {
  final String userId;
  final bool isLock;
  final String error;
  UserBlockOperationError({required this.userId, required this.isLock, required this.error});
}