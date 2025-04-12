class SubChallenge {
  final String id;
  final String title;
  final String description;
  final int points;
  final String status;

  SubChallenge({
    required this.id,
    required this.title,
    required this.description,
    required this.points,
    required this.status,
  });

  factory SubChallenge.fromJson(Map<String, dynamic> json) {
    return SubChallenge(
      id: json['_id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      points: json['points'] as int,
      status: json['status'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'description': description,
      'points': points,
      'status': status,
    };
  }
}
