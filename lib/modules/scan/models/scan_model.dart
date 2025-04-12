class ScanModel {
  final String id;
  final String code;
  final DateTime timestamp;
  final String? location;
  final int points;

  ScanModel({
    required this.id,
    required this.code,
    required this.timestamp,
    this.location,
    required this.points,
  });

  factory ScanModel.fromJson(Map<String, dynamic> json) {
    return ScanModel(
      id: json['_id'] as String,
      code: json['code'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      location: json['location'] as String?,
      points: json['points'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'code': code,
      'timestamp': timestamp.toIso8601String(),
      'location': location,
      'points': points,
    };
  }
}
