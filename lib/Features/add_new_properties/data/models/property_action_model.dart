class PropertyActionResponse {
  final bool success;
  final String message;

  PropertyActionResponse({
    required this.success,
    required this.message,
  });

  factory PropertyActionResponse.fromJson(Map<String, dynamic> json) {
    return PropertyActionResponse(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
    );
  }
}