class LockUnlockModel {
  final bool success;
  final String message;

  LockUnlockModel({required this.success, required this.message});

  factory LockUnlockModel.fromJson(Map<String, dynamic> json) {
    return LockUnlockModel(
      success: json['success'] == true,
      message: json['message'] ?? '',
    );
  }
}