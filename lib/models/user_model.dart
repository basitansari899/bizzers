class UserModel {
  final String id;
  final String username;
  final String fullName;
  final String email;
  final String profilePictureUrl;
  final String bio;
  final int followersCount;
  final int followingCount;
  final int postsCount;
  final String website;
  final bool isVerified;
  final dynamic createdAt;
  final dynamic updatedAt;
  final Map<String, dynamic> extraDetails;

  UserModel({
    required this.id,
    required this.username,
    required this.fullName,
    required this.email,
    required this.profilePictureUrl,
    required this.bio,
    required this.followersCount,
    required this.followingCount,
    required this.postsCount,
    required this.website,
    required this.isVerified,
    required this.createdAt,
    required this.updatedAt,
    required this.extraDetails,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      username: json['username']??"",
      fullName: json['fullName']??"",
      email: json['email']??"",
      profilePictureUrl: json['profilePictureUrl'] ??"",
      bio: json['bio']??"",
      followersCount: json['followersCount'] ?? 0,
      followingCount: json['followingCount'] ?? 0,
      postsCount: json['postsCount'] ?? 0,
      website: json['website'] ??"",
      isVerified: json['isVerified'] ?? false,
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      extraDetails: json['extraDetails'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'fullName': fullName,
      'email': email,
      'profilePictureUrl': profilePictureUrl,
      'bio': bio,
      'followersCount': followersCount,
      'followingCount': followingCount,
      'postsCount': postsCount,
      'website': website,
      'isVerified': isVerified,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'extraDetails': extraDetails,
    };
  }
}
