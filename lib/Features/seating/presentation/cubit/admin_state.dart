import '../../data/models/admin_model.dart';


abstract class AdminState {}

class AdminInitial extends AdminState {}

class AdminLoading extends AdminState {}

class AdminSuccess extends AdminState {
  final List<AdminModel> admins;
  AdminSuccess(this.admins);
}

class AdminFailure extends AdminState {
  final String error;
  AdminFailure(this.error);
}