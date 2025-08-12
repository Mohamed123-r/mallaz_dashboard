class AdminModel {
  final String fullName;
  final String role;
  final String phoneNumber;
  final String password;
  final String confirmPassword;

  AdminModel({

    required this.fullName,
    required this.role,
    required this.phoneNumber,
    required this.password,
    required this.confirmPassword,
  });

  factory AdminModel.fromJson(Map<String, dynamic> json) {
    return AdminModel(

      fullName: json['fullName'] ?? '',
      role: json['role'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      password: json['password'] ?? '',
      confirmPassword: json['confirmPassword'] ?? '',
    );
  }
}

