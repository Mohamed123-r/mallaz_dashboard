
import '../models/User_model.dart';
import '../models/lock_unlock_model.dart';

abstract class UserRepo {
  Future<UserModel> getAllUsers({
    required int pageNumber,
    required int pageSize,
  });
  Future<Map<String, dynamic>> lockUser(String userId);
  Future<Map<String, dynamic>> unlockUser(String userId);
}