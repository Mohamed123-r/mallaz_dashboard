import 'package:book_apartment_dashboard/Features/user_management/data/models/User_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/Data.dart';
import '../../data/repo/user_repo.dart';
import 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final UserRepo repo;
  int pageSize = 7;
  int pageNumber = 1;
  bool isLoading = false;
  bool isLastPage = false;

  UserCubit(this.repo) : super(UserLoading());

  Future<void> fetchUsers({int page = 1, bool reset = false}) async {
    if (isLoading) return;
    isLoading = true;
    emit(UserLoading());
    try {
      final userModel = await repo.getAllUsers(
        pageNumber: page,
        pageSize: 7,
      ); // 7 أو أي رقم تريده
      emit(UserSuccess(userModel));
    } catch (e) {
      emit(UserFailure(e.toString()));
    }
    isLoading = false;
  }
}
