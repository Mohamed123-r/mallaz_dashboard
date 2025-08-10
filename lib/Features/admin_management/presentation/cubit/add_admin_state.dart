import '../../data/models/admin_model.dart';


abstract class AddAdminState {}
class AddAdminInitial extends AddAdminState {}
class AddAdminLoading extends AddAdminState {}
class AddAdminSuccess extends AddAdminState {
  final AdminModel adminModel;
  AddAdminSuccess(this.adminModel);
}