class PropertyModel {
  bool success;
  String message;
  List<Property> data;
  int totalCount;
  int pageNumber;
  int pageSize;
  int totalPage;

  PropertyModel({
    required this.success,
    required this.message,
    required this.data,
    required this.totalCount,
    required this.pageNumber,
    required this.pageSize,
    required this.totalPage,
  });

  factory PropertyModel.fromJson(Map<String, dynamic> json) => PropertyModel(
    success: json['success'],
    message: json['message'],
    data: (json['data'] as List).map((e) => Property.fromJson(e)).toList(),
    totalCount: json['totalCount'],
    pageNumber: json['pageNumber'],
    pageSize: json['pageSize'],
    totalPage: json['totalPage'],
  );
}

class Property {
  int id;
  String governorate;
  String city;
  String createdAt;
  String ownerName;
  String? propertySaleStatus;
  String? propertyRentStatus;

  Property({
    required this.id,
    required this.governorate,
    required this.city,
    required this.createdAt,
    required this.ownerName,
    this.propertySaleStatus,
    this.propertyRentStatus,
  });

  factory Property.fromJson(Map<String, dynamic> json) => Property(
    id: json['id'],
    governorate: json['governorate'],
    city: json['city'],
    createdAt: json['createdAt'],
    ownerName: json['ownerName'],
    propertySaleStatus: json['propertySaleStatus'],
    propertyRentStatus: json['propertyRentStatus'],
  );
}