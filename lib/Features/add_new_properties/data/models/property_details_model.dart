class PropertyDetailsModel {
  final String title;
  final String? description;
  final String type;
  final String rooms;
  final String bathrooms;
  final int area;
  final num price;
  final String floor;
  final String propertyType;
  final String governorate;
  final String city;
  final String? rentType;
  final bool? isFurnished;
  final num? rentAdvance;
  final num? rentPrice;
  final String? priceRentType;
  final String? availabilityStatus;
  final bool? hasWifi;
  final bool isActive;
  final String mainImage;
  final String ownerId;
  final String ownerName;
  final String ownerImage;
  final List<String> images;

  PropertyDetailsModel({
    required this.ownerName,
    required this.ownerImage,
    required this.title,
    required this.description,
    required this.type,
    required this.rooms,
    required this.bathrooms,
    required this.area,
    required this.price,
    required this.floor,
    required this.propertyType,
    required this.governorate,
    required this.city,
    required this.rentType,
    required this.isFurnished,
    required this.rentAdvance,
    required this.rentPrice,
    required this.priceRentType,
    required this.availabilityStatus,
    required this.hasWifi,
    required this.isActive,
    required this.mainImage,
    required this.ownerId,
    required this.images,
  });

  factory PropertyDetailsModel.fromJson(Map<String, dynamic> json) {
    return PropertyDetailsModel(
      title: json['title'] ?? "",
      description: json['description'],
      type: json['type'] ?? "",
      rooms: json['rooms'] ?? "",
      bathrooms: json['bathrooms'] ?? "",
      area: json['area'] ?? 0,
      price: json['price'] ?? 0,
      floor: json['floor'] ?? "",
      propertyType: json['propertyType'] ?? "",
      governorate: json['governorate'] ?? "",
      city: json['city'] ?? "",
      rentType: json['rentType'],
      isFurnished: json['isFurnished'],
      rentAdvance: json['rentAdvance'],
      rentPrice: json['rentPrice'],
      priceRentType: json['priceRentType'],
      availabilityStatus: json['availabilityStatus'],
      hasWifi: json['hasWifi'],
      isActive: json['isActive'] ?? false,
      mainImage: json['mainImage'] ?? "",
      ownerId: json['ownerId'] ?? "",
      images:
          (json['images'] as List<dynamic>? ?? [])
              .map((e) => e.toString())
              .toList(),
      ownerName: json['ownerName'] ?? "",
      ownerImage: json['ownerImage'] ?? "",
    );
  }
}
