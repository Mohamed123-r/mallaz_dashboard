import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/admin_model.dart';
import '../../data/repo/admin_repo.dart';

import 'admin_state.dart';

class AdminCubit extends Cubit<AdminState> {
  final AdminRepo repo;
  AdminCubit(this.repo) : super(AdminInitial());

  Future<void> fetchAllAdmins() async {
    emit(AdminLoading());
    try {
      final res = await repo.getAllAdmins();
      emit(AdminSuccess(res['data']
          .map<AdminModel>((admin) => AdminModel.fromJson(admin))
          .toList()));
    } catch (e) {
      emit(AdminFailure(e.toString()));
    }
  }
}