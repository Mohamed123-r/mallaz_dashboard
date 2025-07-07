import 'package:book_apartment_dashboard/core/api/dio_consumer.dart';
import 'package:book_apartment_dashboard/core/api/end_point.dart';
import 'package:dio/dio.dart';
import '../models/admin_model.dart';
import 'admin_repo.dart';

class AdminRepoImpl implements AdminRepo {
  final DioConsumer dioConsumer;
  AdminRepoImpl({required this.dioConsumer});

  @override
  Future<Map<String ,dynamic>> getAllAdmins() async {
    final response = await dioConsumer.get(EndPoint.getAllAdmins);
    return response;
  }
}