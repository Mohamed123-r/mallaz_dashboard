import 'package:book_apartment_dashboard/Features/user_management/data/models/lock_unlock_model.dart';
import 'package:book_apartment_dashboard/core/api/dio_consumer.dart';
import 'package:book_apartment_dashboard/core/api/end_point.dart';
import '../models/User_model.dart';
import 'user_repo.dart';

class UserRepoImpl implements UserRepo {
  DioConsumer dioConsumer;

  UserRepoImpl({required this.dioConsumer});

  @override
  Future<UserModel> getAllUsers({
    required int pageNumber,
    required int pageSize,
  })async {
    final response = await dioConsumer.get(
      "${EndPoint.getAllUser}pageNumber=$pageNumber&pageSize=$pageSize",
    );
    return UserModel.fromJson(response);
  }
  @override
  Future<Map<String, dynamic>> lockUser(String userId) async {
    final response = await dioConsumer.post('/api/User/Lock/$userId');
    return  response;
  }

  @override
  Future<Map<String, dynamic>> unlockUser(String userId) async {
    final response = await dioConsumer.post('/api/User/Unlock/$userId');
    return response;
  }
}