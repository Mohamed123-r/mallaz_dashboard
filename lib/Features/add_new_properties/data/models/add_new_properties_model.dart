class PropertyRequestModel {
  final int id;
  final String governorate;
  final String city;
  final String userFullName;
  final String? userImage;
  final DateTime createdAt;
  final String propertyType;
  final String propertyMainImage;

  PropertyRequestModel({
    required this.id,
    required this.governorate,
    required this.city,
    required this.userFullName,
    required this.userImage,
    required this.createdAt,
    required this.propertyType,
    required this.propertyMainImage,
  });

  factory PropertyRequestModel.fromJson(Map<String, dynamic> json) {
    return PropertyRequestModel(
      id: json['id'],
      governorate: json['governorate'] ?? '',
      city: json['city'] ?? '',
      userFullName: json['userFullName'] ?? '',
      userImage: json['userImage'],
      createdAt: DateTime.tryParse(json['createdAt'] ?? '') ?? DateTime.now(),
      propertyType: json['propertyType'] ?? '',
      propertyMainImage: json['propertyMainImage'] ?? '',
    );
  }
}

class PropertyRequestResponse {
  final bool success;
  final String message;
  final List<PropertyRequestModel> data;
  final int totalCount;
  final int pageNumber;
  final int pageSize;
  final int totalPage;

  PropertyRequestResponse({
    required this.success,
    required this.message,
    required this.data,
    required this.totalCount,
    required this.pageNumber,
    required this.pageSize,
    required this.totalPage,
  });

  factory PropertyRequestResponse.fromJson(Map<String, dynamic> json) {
    return PropertyRequestResponse(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: (json['data'] as List<dynamic>? ?? [])
          .map((e) => PropertyRequestModel.fromJson(e))
          .toList(),
      totalCount: json['totalCount'] ?? 0,
      pageNumber: json['pageNumber'] ?? 1,
      pageSize: json['pageSize'] ?? 0,
      totalPage: json['totalPage'] ?? 1,
    );
  }
}