import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repo/add_admin_repo.dart';
import 'add_admin_state.dart';

class AddAdminCubit extends Cubit<AddAdminState> {
  AddAdminCubit( {required this.repo}) : super(AddAdminInitial());
  final AddAdminRepo repo;

  Future<void> addAdmin({
    required String fullName,
    required String phoneNumber,
    required String password,
    required String confirmPassword,
  }) async {
    emit(AddAdminLoading());
    try {
      final response = await repo.addAdmin(
        fullName: fullName,

        phoneNumber: phoneNumber,
        password: password,
        confirmPassword: confirmPassword,
      );
      emit(AddAdminSuccess(response));
    } catch (e) {
      emit(
        AddAdminFailure(
          error:
              e.toString().isEmpty
                  ? "حدث خطأ أثناء إضافة المسؤول"
                  : e.toString(),
        ),
      );
    }
  }
}
