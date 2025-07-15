class PropertyModel {
  PropertyModel({
    required this.success,
    required this.message,
    required this.data,
    required this.totalCount,
    required this.pageNumber,
    required this.pageSize,
    required this.totalPage,
  });
  final bool success;
  final String message;
  final List<DataModel> data;
  final int totalCount;
  final int pageNumber;
  final int pageSize;
  final int totalPage;

  factory PropertyModel.fromJson(Map<String, dynamic> json) {
    return PropertyModel(
      success: json['success'] as bool? ?? false, // Handle null with default false
      message: json['message'] as String? ?? '', // Handle null with default empty string
      data: (json['data'] as List? ?? [])
          .map((item) => DataModel.fromJson(item as Map<String, dynamic>))
          .toList(),
      totalCount: json['totalCount'] as int? ?? 0, // Handle null with default 0
      pageNumber: json['pageNumber'] as int? ?? 0, // Handle null with default 0
      pageSize: json['pageSize'] as int? ?? 0, // Handle null with default 0
      totalPage: json['totalPage'] as int? ?? 0, // Handle null with default 0
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'data': data.map((item) => item.toJson()).toList(),
      'totalCount': totalCount,
      'pageNumber': pageNumber,
      'pageSize': pageSize,
      'totalPage': totalPage,
    };
  }
}

class DataModel {
  DataModel({
    required this.id,
    required this.governorate,
    required this.city,
    required this.createdAt,
    required this.ownerName,
    required this.propertySaleStatus,
    required this.propertyRentStatus,
  });
  final int id;
  final String governorate;
  final String city;
  final String createdAt;
  final String ownerName;
  final String propertySaleStatus;
  final String propertyRentStatus;

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      id: json['id'] as int? ?? 0,
      governorate: json['governorate'] as String? ?? '',
      city: json['city'] as String? ?? '',
      createdAt: json['createdAt'] as String? ?? '',
      ownerName: json['ownerName'] as String? ?? '',
      propertySaleStatus: json['propertySaleStatus'] as String? ?? '',
      propertyRentStatus: json['propertyRentStatus'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'governorate': governorate,
      'city': city,
      'createdAt': createdAt,
      'ownerName': ownerName,
      'propertySaleStatus': propertySaleStatus,
      'propertyRentStatus': propertyRentStatus,
    };
  }
}