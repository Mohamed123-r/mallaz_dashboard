

import '../models/property_action_model.dart';

abstract class PropertyActionsRepo {
  Future<PropertyActionResponse> acceptProperty(int propertyId);
  Future<PropertyActionResponse> deleteProperty(int propertyId);
}