class ScanResult {
  final String id;
  final String code;
  final DateTime timestamp;
  final bool isValid;

  ScanResult({
    required this.id,
    required this.code,
    required this.timestamp,
    required this.isValid,
  });

  factory ScanResult.fromJson(Map<String, dynamic> json) {
    return ScanResult(
      id: json['id'] as String,
      code: json['code'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      isValid: json['isValid'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'code': code,
      'timestamp': timestamp.toIso8601String(),
      'isValid': isValid,
    };
  }
}
