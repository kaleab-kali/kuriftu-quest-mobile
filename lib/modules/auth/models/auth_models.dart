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
  final String token;
  final String userId;
  final User user;

  AuthResponse({
    required this.token,
    required this.userId,
    required this.user,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      token: json['token'],
      userId: json['userId'],
      user: User.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'token': token,
      'userId': userId,
      'user': user.toJson(),
    };
  }
}
