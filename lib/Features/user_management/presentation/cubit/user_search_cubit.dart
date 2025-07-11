import 'package:book_apartment_dashboard/Features/user_management/data/models/user_search_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repo/user_search_repo.dart';

part 'user_search_state.dart';

class UserSearchCubit extends Cubit<UserSearchState> {
  final UserSearchRepo userSearchRepo;

  UserSearchCubit({required this.userSearchRepo}) : super(UserSearchInitial());

  Future<void> searchUsersByName(String name) async {
    emit(UserSearchLoading());
    try {
      final userSearchModel = await userSearchRepo.searchUsersByName(name);
      emit(UserSearchSuccess(userSearchModel: userSearchModel));
    } catch (e) {
      emit(UserSearchFailure(error: e.toString()));
    }
  }

  void resetSearch() {
    emit(UserSearchInitial()); // إعادة تعيين الحالة إلى الافتراضية
  }
}