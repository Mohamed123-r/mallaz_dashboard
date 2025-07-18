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

  factory PropertyModel.fromJson(Map<String, dynamic> json) {
    return PropertyModel(
      success: json['success'],
      message: json['message'],
      data: (json['data'] as List).map((e) => Property.fromJson(e)).toList(),
      totalCount: json['totalCount'],
      pageNumber: json['pageNumber'],
      pageSize: json['pageSize'],
      totalPage: json['totalPage'],
    );
  }
}

class Property {
  int id;
  String? governorate; // جعلها قابلة للـ null
  String? city;        // جعلها قابلة للـ null
  String? createdAt;   // جعلها قابلة للـ null
  String? ownerName;   // جعلها قابلة للـ null
  String? propertySaleStatus;
  String? propertyRentStatus;

  Property({
    required this.id,
    this.governorate,
    this.city,
    this.createdAt,
    this.ownerName,
    this.propertySaleStatus,
    this.propertyRentStatus,
  });

  factory Property.fromJson(Map<String, dynamic> json) => Property(
    id: json['id'],
    governorate: json['governorate'] as String?, // التعامل مع null
    city: json['city'] as String?,             // التعامل مع null
    createdAt: json['createdAt'] as String?,   // التعامل مع null
    ownerName: json['ownerName'] as String?,   // التعامل مع null
    propertySaleStatus: json['propertySaleStatus'] as String?,
    propertyRentStatus: json['propertyRentStatus'] as String?,
  );
}