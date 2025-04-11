class Challenge {
  final String id;
  final String title;
  final String description;
  final String category;
  final int points;
  final String imageUrl;
  final bool isActive;
  final String? qrCodeId;
  final DateTime createdAt;

  Challenge({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.points,
    required this.imageUrl,
    required this.isActive,
    this.qrCodeId,
    required this.createdAt,
  });

  factory Challenge.fromJson(Map<String, dynamic> json) {
    return Challenge(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      category: json['category'] as String,
      points: json['points'] as int,
      imageUrl: json['image_url'] as String,
      isActive: json['is_active'] as bool,
      qrCodeId: json['qr_code_id'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'points': points,
      'image_url': imageUrl,
      'is_active': isActive,
      'qr_code_id': qrCodeId,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
