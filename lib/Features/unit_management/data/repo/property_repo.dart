import 'package:book_apartment_dashboard/Features/unit_management/data/models/property_model.dart';

abstract class PropertyRepo {
  Future<PropertyModel> fetchProperties({
    required String propertyType,
    required int pageNumber,
    required int pageSize,
    String? propertySaleStatus,
    String? propertyRentStatus,
  });
}