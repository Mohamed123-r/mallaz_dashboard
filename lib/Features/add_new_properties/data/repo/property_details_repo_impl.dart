import 'package:book_apartment_dashboard/Features/add_new_properties/data/repo/property_details_repo.dart';
import 'package:book_apartment_dashboard/core/api/dio_consumer.dart';

import '../models/property_details_model.dart';

class PropertyDetailsRepoImpl implements PropertyDetailsRepo {
  final DioConsumer dioConsumer;
  PropertyDetailsRepoImpl({required this.dioConsumer});

  @override
  Future<PropertyDetailsModel> getPropertyDetails(int propertyId) async {
    final res = await dioConsumer.get('/api/Property/$propertyId');
    return PropertyDetailsModel.fromJson(res['data']);
  }
}