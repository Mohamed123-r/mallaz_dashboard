import '../models/property_details_model.dart';

abstract class PropertyDetailsRepo {
  Future<PropertyDetailsModel> getPropertyDetails(int propertyId);
}
