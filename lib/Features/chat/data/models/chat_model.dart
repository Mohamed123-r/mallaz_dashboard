class
ChatModel {
  final String id;
  final String name;
  final String description;
  final String imageUrl;

  ChatModel({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'imageUrl': imageUrl,
    };
  }
}