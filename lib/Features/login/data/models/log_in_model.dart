class LoginModel {
  final bool success;
  final String message;
  final LoginData? data;

  LoginModel({required this.success, required this.message, this.data});

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: json['data'] != null ? LoginData.fromJson(json['data']) : null,
    );
  }
}

class LoginData {
  final String userId;
  final String name;
  final String role;
  final String? userImage;
  final String token;

  LoginData({
    required this.userId,
    required this.name,
    required this.role,
    this.userImage,
    required this.token,
  });

  factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(
      userId: json['userId'] ?? '',
      name: json['name'] ?? '',
      role: json['role'] ?? '',
      userImage: json['userImage'],
      token: json['token'] ?? '',
    );
  }
}