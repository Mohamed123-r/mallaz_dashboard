class PropertyDetailsModel {
  final int? id;
  final String? title;
  final String? description;
  final String? type;
  final String? rooms;
  final String? bathrooms;
  final int? area;
  final num? price;
  final String? floor;
  final String? propertyType;
  final String? governorate;
  final String? city;
  final String? rentType;
  final bool? isFurnished;
  final num? rentAdvance;
  final num? rentPrice;
  final String? priceRentType;
  final String? availabilityStatus;
  final String? propertySaleStatus;
  final bool? hasWifi;
  final bool? isActive;
  final String? mainImage;
  final String? ownerId;
  final String? ownerName;
  final String? ownerImage;
  final List<String>? images;

  PropertyDetailsModel({this.propertySaleStatus,
    this.id,
     this.ownerName,
     this.ownerImage,
     this.title,
     this.description,
     this.type,
     this.rooms,
     this.bathrooms,
     this.area,
     this.price,
     this.floor,
     this.propertyType,
     this.governorate,
     this.city,
     this.rentType,
     this.isFurnished,
     this.rentAdvance,
     this.rentPrice,
     this.priceRentType,
     this.availabilityStatus,
     this.hasWifi,
     this.isActive,
     this.mainImage,
     this.ownerId,
     this.images,
  });

  factory PropertyDetailsModel.fromJson(Map<String, dynamic> json) {
    return PropertyDetailsModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? "",
      description: json['description'],
      type: json['type'] ?? "",
      rooms: json['rooms'] ?? "",
      bathrooms: json['bathrooms'] ?? "",
      area: json['area'] ?? 0,
      price: json['price'] ?? 0,
      floor: json['floor'] ?? "",
      propertyType: json['propertyType'] ?? "",
      governorate: json['governorate']?? "" ,
      city: json['city']?? "" ,
      rentType: json['rentType']?? "",
      isFurnished: json['isFurnished']?? "",
      rentAdvance: json['rentAdvance']?? "",
      rentPrice: json['rentPrice']?? "",
      priceRentType: json['priceRentType']?? "",
      availabilityStatus: json['availabilityStatus']?? "",
      propertySaleStatus: json['PropertySaleStatus']?? "",
      hasWifi: json['hasWifi']?? "",
      isActive: json['isActive'] ?? "",
      mainImage: json['mainImage'] ?? "",
      ownerId: json['ownerId']?? "",
      images:
          (json['images'] as List<dynamic>? ?? [])
              .map((e) => e.toString())
              .toList(),
      ownerName: json['ownerName']?? "" ,
      ownerImage: json['ownerImage']?? "" ,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'type': type,
      'rooms': rooms,
      'bathrooms': bathrooms,
      'area': area,
      'price': price,
      'floor': floor,
      'propertyType': propertyType,
      'governorate': governorate,
      'city': city,
      'rentType': rentType,
      'isFurnished': isFurnished,
      'rentAdvance': rentAdvance,
      'rentPrice': rentPrice,
      'priceRentType': priceRentType,
      'availabilityStatus': availabilityStatus,
      'hasWifi': hasWifi,
      'isActive': isActive,
      'mainImage': mainImage,
      'ownerId': ownerId,
      'ownerName': ownerName,
      'ownerImage': ownerImage,
      'images': images,
      'propertySaleStatus':propertySaleStatus
    };
  }
}
