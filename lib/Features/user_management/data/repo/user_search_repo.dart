import 'package:book_apartment_dashboard/Features/user_management/data/models/user_search_model.dart';

abstract class UserSearchRepo {
  Future<UserSearchModel> searchUsersByName(String name);
}