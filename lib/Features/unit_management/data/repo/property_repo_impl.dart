import 'package:book_apartment_dashboard/Features/unit_management/data/repo/property_repo.dart';
import 'package:dio/dio.dart';

import '../../../../core/api/dio_consumer.dart';
import '../models/property_model.dart';

class PropertyRepoImpl implements PropertyRepo {
  final DioConsumer dioConsumer;

  PropertyRepoImpl({required this.dioConsumer});

  @override
  Future<List<PropertyModel>> fetchProperties({
    required String propertyType,
    String? propertySaleStatus,
    String? propertyRentStatus,
    required int pageNumber,
    required int pageSize,
  }) async {
    try {
      final response = await dioConsumer.get(
        '/api/Property/GetPropertyOnDashboard/?PropertyType=$propertyType&PageNumber=$pageNumber&PageSize=$pageSize&PropertySaleStatus=$propertySaleStatus&PropertyRentStatus=$propertyRentStatus',
      ) as Map<String, dynamic>;
      return [PropertyModel.fromJson(response)]; // Return list with one PropertyModel
    } catch (e) {
      throw Exception('Error fetching properties: $e');
    }
  }
}