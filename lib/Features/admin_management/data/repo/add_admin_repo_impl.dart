import 'package:book_apartment_dashboard/core/api/dio_consumer.dart';
import 'package:book_apartment_dashboard/core/api/end_point.dart';
import 'package:dio/dio.dart';
import '../models/admin_model.dart';
import 'add_admin_repo.dart';
import 'admin_repo.dart';

class AddAdminRepoImpl implements AddAdminRepo {
  final DioConsumer dioConsumer;
  AddAdminRepoImpl({required this.dioConsumer});

  @override
  Future<Map<String ,dynamic>> addAdmin({
    String fullName = '',
    String phoneNumber = '',
    String password = '',
    String confirmPassword = '',
  }) async {
    try {
      final res = await dioConsumer.post(
        EndPoint.addAdmin,
        data: {
          'fullName': fullName,
          'phoneNumber': phoneNumber,
          'rule': "admin",
          'password': password,
          'confirmPassword': confirmPassword,
        },
      );
      return res;
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }
}