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
    // هنا تأكد أن response عبارة عن Map أو Json
    return UserModel.fromJson(response);
  }
}