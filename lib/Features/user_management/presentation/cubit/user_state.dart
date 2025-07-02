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