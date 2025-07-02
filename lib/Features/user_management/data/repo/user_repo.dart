
import '../models/User_model.dart';

abstract class UserRepo {
  Future<UserModel> getAllUsers({
    required int pageNumber,
    required int pageSize,
  });
}