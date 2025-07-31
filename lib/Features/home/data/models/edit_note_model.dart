class EditNoteModel {
  final bool success;
  final String message;

  EditNoteModel({
    required this.success,
    required this.message,
  });

  factory EditNoteModel.fromJson(Map<String, dynamic> json) {
    return EditNoteModel(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
    );
  }
}