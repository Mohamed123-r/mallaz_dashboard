import 'package:book_apartment_dashboard/core/api/dio_consumer.dart';
import 'package:book_apartment_dashboard/core/api/end_point.dart';


import '../models/log_in_model.dart';
import 'log_in_repo.dart';

class LoginRepoImpl implements LoginRepo {
  final DioConsumer dioConsumer;


  LoginRepoImpl({required this.dioConsumer,});

  @override
  Future<LoginModel> login(String phoneNumber, String password) async {
    final response = await dioConsumer.post(
      EndPoint.login,
      data: {
        'phoneNumber': phoneNumber,
        'password': password,
      },
    );
    return LoginModel.fromJson(response);
  }
}