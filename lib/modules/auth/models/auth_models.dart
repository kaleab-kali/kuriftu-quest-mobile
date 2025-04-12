class User {
  final String id;
  final String email;
  final String? name;
  final String? profileImage;
  final int points;
  final String membershipTier;

  User({
    required this.id,
    required this.email,
    this.name,
    this.profileImage,
    required this.points,
    required this.membershipTier,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      profileImage: json['profileImage'],
      points: json['points'] ?? 0,
      membershipTier: json['membershipTier'] ?? 'Bronze',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'profileImage': profileImage,
      'points': points,
      'membershipTier': membershipTier,
    };
  }
}

class AuthResponse {
  final bool success;
  final Map<String, dynamic> data;
  final String? message;

  AuthResponse({
    required this.success,
    required this.data,
    this.message,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      success: json['success'] ?? false,
      data: json['data'] ?? {},
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': data,
      'message': message,
    };
  }
}
