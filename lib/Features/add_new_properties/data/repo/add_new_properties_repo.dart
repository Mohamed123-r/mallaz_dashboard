import '../models/add_new_properties_model.dart';


abstract class PropertyRequestRepo {
  Future<PropertyRequestResponse> getRequestsToAddProperties({
    int pageNumber,
    int pageSize,
    String? propertyType,
  });
}