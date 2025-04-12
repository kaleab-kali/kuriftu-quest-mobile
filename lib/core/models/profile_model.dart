class ProfileModel {
  final String? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? membershipTier;
  final int? points;
  final String? profileImage;

  ProfileModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.membershipTier,
    this.points,
    this.profileImage,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      membershipTier: json['membershipTier'],
      points: json['points'],
      profileImage: json['profileImage'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'membershipTier': membershipTier,
      'points': points,
      'profileImage': profileImage,
    };
  }
}
