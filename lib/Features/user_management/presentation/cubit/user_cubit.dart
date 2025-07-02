import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/User_model.dart';
import '../../data/repo/user_repo.dart';
import 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepo repo;
  UserModel? _cachedUsers; // كاش الداتا
// رقم الصفحة الحالي

  UserCubit(this.repo) : super(UserInitial());

  Future<void> fetchUsers({int page = 1}) async {
    emit(UserLoading());
    try {
      final userModel = await repo.getAllUsers(
        pageNumber: page,
        pageSize: 7,
      );
      _cachedUsers = userModel;
      emit(UserSuccess(userModel));
    } catch (e) {
      emit(UserFailure(e.toString()));
    }
  }
  Future<void> lockUser(String userId) async {

    emit(UserBlockOperationInProgress(userId: userId, isLock: true));
    try {
      final response = await repo.lockUser(userId);
      emit(UserBlockOperationSuccess(
        userId: userId,
        isLock: true,
        message: response['message'] ?? 'User locked successfully',
      ));
    } catch (e) {
      emit(UserBlockOperationError(
        userId: userId,
        isLock: true,
        error: e.toString(),
      ));
    }





  }

  Future<void> unlockUser(String userId ) async {

    emit(UserBlockOperationInProgress(userId: userId, isLock: false));
    try {
      final response = await repo.unlockUser(userId);
      emit(UserBlockOperationSuccess(
        userId: userId,
        isLock: false,
        message:  response['message'] ?? 'User unlocked successfully',
      ));
// تحديث الداتا بعد إلغاء الحظر
    } catch (e) {
      emit(UserBlockOperationError(
        userId: userId,
        isLock: false,
        error: e.toString(),
      ));
    }

  }
}