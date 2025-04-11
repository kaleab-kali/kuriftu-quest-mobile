class Reward {
  final String id;
  final String title;
  final String description;
  final int points;
  final bool isRedeemed;

  Reward({
    required this.id,
    required this.title,
    required this.description,
    required this.points,
    required this.isRedeemed,
  });

  factory Reward.fromJson(Map<String, dynamic> json) {
    return Reward(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      points: json['points'] as int,
      isRedeemed: json['isRedeemed'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'points': points,
      'isRedeemed': isRedeemed,
    };
  }
}
