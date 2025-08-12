import '../../data/models/admin_model.dart';


abstract class AddAdminState {}
class AddAdminInitial extends AddAdminState {}
class AddAdminLoading extends AddAdminState {}
class AddAdminSuccess extends AddAdminState {
  final Map<String, dynamic> response;
  AddAdminSuccess(this.response);
}
class AddAdminFailure extends AddAdminState {
  final String error;
  AddAdminFailure({this.error = "حدث خطأ أثناء إضافة المسؤول"});
}