

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repo/log_in_repo.dart';
import 'log_in_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo loginRepo;

  LoginCubit({required this.loginRepo}) : super(LoginInitial());

  Future<void> login(String phoneNumber, String password) async {
    emit(LoginLoading());
    try {
      final loginModel = await loginRepo.login(phoneNumber, password);

      if (loginModel.data!.role == "Admin") {
        emit(LoginSuccess(loginModel: loginModel));
      }
      else {
        emit(LoginFailure(error: "You are not an admin"));
      }
    } catch (e) {
      emit(LoginFailure(error: e.toString()));
    }
  }
}