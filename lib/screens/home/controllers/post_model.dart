import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  final String postId;
  final String userId;
  final String name;
  final String username;
  final String postDescription;
  final String userImage;
  final String postImage;
  final int likesCount;
  final int dislikesCount;
  final int commentsCount;
  final DateTime createdAt;

  PostModel({
    required this.postId,
    required this.userId,
    required this.name,
    required this.username,
    required this.postDescription,
    required this.userImage,
    required this.postImage,
    required this.likesCount,
    required this.dislikesCount,
    required this.commentsCount,
    required this.createdAt,
  });

  factory PostModel.fromJson(String id, Map<String, dynamic>? json) {
    // Default values for null cases
    return PostModel(
      postId: id,
      userId: json?['userId'] ?? '',
      name: json?['name'] ?? '',
      username: json?['username'] ?? '',
      postDescription: json?['post_description'] ?? '',
      userImage: json?['user_image'] ?? '',
      postImage: json?['post_image'] ?? '',
      likesCount: json?['likes_count'] ?? 0,
      dislikesCount: json?['dislikes_count'] ?? 0,
      commentsCount: json?['comments_count'] ?? 0,
      createdAt: (json?['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'name': name,
      'username': username,
      'post_description': postDescription,
      'user_image': userImage,
      'post_image': postImage,
      'likes_count': likesCount,
      'dislikes_count': dislikesCount,
      'comments_count': commentsCount,
      'createdAt': createdAt,
    };
  }
}
