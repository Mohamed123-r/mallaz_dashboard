class AdminModel {
  final String id;
  final String userName;
  final String email;
  final String phoneNumber;
  final bool isBlocked;

  AdminModel({
    required this.id,
    required this.userName,
    required this.email,
    required this.phoneNumber,
    required this.isBlocked,
  });

  factory AdminModel.fromJson(Map<String, dynamic> json) {
    return AdminModel(
      id: json['id'] ?? '',
      userName: json['userName'] ?? '',
      email: json['email'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      isBlocked: json['isBlocked'] ?? false,
    );
  }
}

class GetAllAdminsResponse {
  final bool success;
  final String message;
  final List<AdminModel> data;

  GetAllAdminsResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  factory GetAllAdminsResponse.fromJson(Map<String, dynamic> json) {
    return GetAllAdminsResponse(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: (json['data'] as List<dynamic>? ?? [])
          .map((e) => AdminModel.fromJson(e))
          .toList(),
    );
  }
}