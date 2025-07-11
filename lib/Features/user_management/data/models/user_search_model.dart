class UserSearchModel {
  final bool success;
  final String message;
  final List<UserSearchData>? data;

  UserSearchModel({required this.success, required this.message, this.data});

  factory UserSearchModel.fromJson(Map<String, dynamic> json) {
    return UserSearchModel(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      data: json['data'] != null
          ? List<UserSearchData>.from(
          json['data'].map((x) => UserSearchData.fromJson(x)))
          : null,
    );
  }
}

class UserSearchData {
  String? id;
  String? userName;
  String? email;
  String? phoneNumber;
  bool? isBlocked;

  UserSearchData({
    this.id,
    this.userName,
    this.email,
    this.phoneNumber,
    this.isBlocked,
  }
  );
  factory UserSearchData.fromJson(Map<String, dynamic> json) {
    return UserSearchData(
      id: json['id'] ?? '',
      userName: json['userName'] ?? '',
      email: json['email'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      isBlocked: json['isBlocked'] ?? false,
    );
  }
}