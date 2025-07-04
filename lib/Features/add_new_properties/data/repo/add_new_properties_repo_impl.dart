import 'package:book_apartment_dashboard/core/api/dio_consumer.dart';
import 'package:dio/dio.dart';
import '../../../../core/api/end_point.dart';
import '../models/add_new_properties_model.dart';
import 'add_new_properties_repo.dart';


class PropertyRequestRepoImpl implements PropertyRequestRepo {
  final DioConsumer dioConsumer;
  PropertyRequestRepoImpl({required this.dioConsumer});

  @override
  Future<PropertyRequestResponse> getRequestsToAddProperties({
    int pageNumber = 1,
    int pageSize = 5,
    String? propertyType,
  }) async {
    final response = await dioConsumer.get(
      '${EndPoint.getRequestsToAddProperties}?pageNumber=$pageNumber&pageSize=$pageSize&PropertyType=$propertyType',

    );
    return  PropertyRequestResponse.fromJson(response);
  }
}