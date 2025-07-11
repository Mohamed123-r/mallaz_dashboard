import 'package:book_apartment_dashboard/core/api/dio_consumer.dart';
import 'package:book_apartment_dashboard/core/api/end_point.dart';
import 'package:dio/dio.dart';

import '../models/log_in_model.dart';
import 'log_in_repo.dart';

class LoginRepoImpl implements LoginRepo {
  final DioConsumer dioConsumer;
  final String baseUrl = 'http://realestateunits.runasp.net';

  LoginRepoImpl({required this.dioConsumer});

  @override
  Future<LoginModel> login(String phoneNumber, String password) async {
    try {
      final response = await dioConsumer.post(
        '$baseUrl${EndPoint.login}',
        data: {
          'phoneNumber': phoneNumber,
          'password': password,
        },
      );
      return LoginModel.fromJson(response);
    } catch (e) {
      if (e is DioException) {
        throw Exception('خطأ في الشبكة: ${e.message}');
      }
      throw Exception('فشل تسجيل الدخول: $e');
    }
  }
}