import 'package:book_apartment_dashboard/Features/add_new_properties/data/repo/property_details_repo.dart';
import 'package:book_apartment_dashboard/constant.dart';
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

  @override
  Future<void> updatePropertyDetails(PropertyDetailsModel property) async {
    logger.w(
      "Saving changes for : ${property.id},,,${property.propertySaleStatus},",
    );

    await dioConsumer.put(
      '/api/Property',
      data: {
        "propertyId": property.id,
        "title": property.title,
        "description": property.description,
        "rooms": property.rooms,
        "bathrooms": property.bathrooms,
        "area": property.area,
        "price": property.price,
        "floor": property.floor,
        "isFurnished": property.isFurnished,
        "propertyType": property.propertyType,
        "governorate": property.governorate,
        "city": property.city,
        "rentType": property.rentType,
        "rentAdvance": property.rentAdvance,
        "rentPrice": property.rentPrice,
        "priceRentType": property.priceRentType,
        "availabilityStatus": property.availabilityStatus,
        "hasWifi": property.hasWifi,
        "isActive": property.isActive,
        "propertySaleStatus": property.propertySaleStatus,
      },
    );
  }
}
