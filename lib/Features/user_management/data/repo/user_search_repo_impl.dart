import 'package:book_apartment_dashboard/Features/user_management/data/models/user_search_model.dart';
import 'package:book_apartment_dashboard/Features/user_management/data/repo/user_search_repo.dart';
import 'package:book_apartment_dashboard/core/api/dio_consumer.dart';
import 'package:dio/dio.dart';

class UserSearchRepoImpl implements UserSearchRepo {
  final DioConsumer dioConsumer;
  final String baseUrl = 'http://realestateunits.runasp.net';

  UserSearchRepoImpl({required this.dioConsumer});

  @override
  Future<UserSearchModel> searchUsersByName(String name) async {
    try {
      final response = await dioConsumer.get(
        '/api/User/SearshByUserName?Name=$name',
      );
      return UserSearchModel.fromJson(response);
    } catch (e) {
      if (e is DioException) {
        throw Exception('خطأ في الشبكة: ${e.message}');
      }
      throw Exception('فشل البحث: $e');
    }
  }
}