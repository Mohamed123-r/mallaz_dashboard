class AppointmentModel {
  final bool success;
  final String message;
  final List<Appointment> data;
  final int totalCount;
  final int pageNumber;
  final int pageSize;
  final int totalPage;

  AppointmentModel({
    required this.success,
    required this.message,
    required this.data,
    required this.totalCount,
    required this.pageNumber,
    required this.pageSize,
    required this.totalPage,
  });

  factory AppointmentModel.fromJson(Map<String, dynamic> json) {
    return AppointmentModel(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: (json['data'] as List).map((e) => Appointment.fromJson(e)).toList(),
      totalCount: json['totalCount'] ?? 0,
      pageNumber: json['pageNumber'] ?? 1,
      pageSize: json['pageSize'] ?? 10,
      totalPage: json['totalPage'] ?? 1,
    );
  }
}

class AppointmentDetailsModel {
  final bool success;
  final String message;
  final Appointment data;

  AppointmentDetailsModel({
    required this.success,
    required this.message,
    required this.data,
  });

  factory AppointmentDetailsModel.fromJson(Map<String, dynamic> json) {
    return AppointmentDetailsModel(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: Appointment.fromJson(json['data']),
    );
  }
}

class Appointment {
  final int id;
  final int propertyId;
  final String title;
  final String ownerName;
  final String ownerPhone;
  final String? ownerImage;
  final String propertyType;
  final String createdAt;
  final String requesterId;
  final String notes;
  final String requesterName;
  final String requesterPhone;
  final String? requesterImage;

  Appointment({
    required this.id,
    required this.propertyId,
    required this.title,
    required this.ownerName,
    required this.ownerPhone,
    this.ownerImage,
    required this.propertyType,
    required this.createdAt,
    required this.requesterId,
    required this.notes,
    required this.requesterName,
    required this.requesterPhone,
    this.requesterImage,
  });

  factory Appointment.fromJson(Map<String, dynamic> json) {
    return Appointment(
      id: json['id'] ?? 0,
      propertyId: json['propertyId'] ?? 0,
      title: json['tilte'] ?? '', // ملاحظة: 'tilte' بها خطأ إملائي في الـ API، يجب أن يكون 'title'
      ownerName: json['ownerName'] ?? '',
      ownerPhone: json['ownerPhone'] ?? '',
      ownerImage: json['ownerImage'],
      propertyType: json['propertyType'] ?? '',
      createdAt: json['createdAt'] ?? '',
      requesterId: json['requesterId'] ?? '',
      notes: json['notes'] ?? '',
      requesterName: json['requesterName'] ?? '',
      requesterPhone: json['requesterPhone'] ?? '',
      requesterImage: json['requesterImage'],
    );
  }


 factory Appointment.fromMap(Map<String, dynamic> map) {
    return Appointment(
      id: map['id'] ?? 0,
      propertyId: map['propertyId'] ?? 0,
      title: map['title'] ?? '',
      ownerName: map['ownerName'] ?? '',
      ownerPhone: map['ownerPhone'] ?? '',
      ownerImage: map['ownerImage'],
      propertyType: map['propertyType'] ?? '',
      createdAt: map['createdAt'] ?? '',
      requesterId: map['requesterId'] ?? '',
      notes: map['notes'] ?? '',
      requesterName: map['requesterName'] ?? '',
      requesterPhone: map['requesterPhone'] ?? '',
      requesterImage: map['requesterImage'],
    );
  }
}