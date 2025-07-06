import 'package:book_apartment_dashboard/Features/add_new_properties/data/repo/property_action_repo.dart';
import 'package:dio/dio.dart';
import '../models/property_action_model.dart';


class PropertyActionsRepoImpl implements PropertyActionsRepo {
  final Dio dio;
  PropertyActionsRepoImpl(this.dio);

  @override
  Future<PropertyActionResponse> acceptProperty(int propertyId) async {
    final response = await dio.patch(
      'http://realestateunits.runasp.net/api/Property/$propertyId',
    );
    return PropertyActionResponse.fromJson(response.data);
  }

  @override
  Future<PropertyActionResponse> deleteProperty(int propertyId) async {
    final response = await dio.delete(
      'http://realestateunits.runasp.net/api/Property/$propertyId',
    );
    return PropertyActionResponse.fromJson(response.data);
  }
}