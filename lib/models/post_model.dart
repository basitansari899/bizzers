enum PostType { video, image, text, voice }

class ContentModel {
  final String fileId;
  final String fileUrl;
  final PostType type;

  ContentModel({
    required this.fileId,
    required this.fileUrl,
    required this.type,
  });

  factory ContentModel.fromJson(Map<String, dynamic> json) {
    return ContentModel(
      fileId: json['fileId'] as String,
      fileUrl: json['fileUrl'] as String,
      type: PostType.values[json['type'] ?? 0],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fileId': fileId,
      'fileUrl': fileUrl,
      'type': type.index,
    };
  }
}

class PostModels {
  final String id;
  final String userId;
  final List<ContentModel> contents;
  final String textContent;
  final int likesCount;
  final int commentsCount;
  final int sharesCount;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<String> hashtags;
  final List<String> mentions;
  final bool isLiked;
  final bool isBookmarked;

  PostModels({
    required this.id,
    required this.userId,
    required this.contents,
    this.textContent = '',
    this.likesCount = 0,
    this.commentsCount = 0,
    this.sharesCount = 0,
    DateTime? createdAt,
    DateTime? updatedAt,
    this.hashtags = const [],
    this.mentions = const [],
    this.isLiked = false,
    this.isBookmarked = false,
  })  : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  factory PostModels.fromJson(Map<String, dynamic> json) {
    return PostModels(
      id: json['id'] as String,
      userId: json['userId'] as String,
      contents: (json['contents'] as List<dynamic>?)
          ?.map((contentJson) => ContentModel.fromJson(contentJson))
          .toList() ??
          [],
      textContent: json['textContent'] ?? '',
      likesCount: json['likesCount'] ?? 0,
      commentsCount: json['commentsCount'] ?? 0,
      sharesCount: json['sharesCount'] ?? 0,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : DateTime.now(),
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : DateTime.now(),
      hashtags: json['hashtags'] != null
          ? List<String>.from(json['hashtags'])
          : [],
      mentions: json['mentions'] != null
          ? List<String>.from(json['mentions'])
          : [],
      isLiked: json['isLiked'] ?? false,
      isBookmarked: json['isBookmarked'] ?? false,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'contents': contents.map((content) => content.toJson()).toList(),
      'textContent': textContent,
      'likesCount': likesCount,
      'commentsCount': commentsCount,
      'sharesCount': sharesCount,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'hashtags': hashtags,
      'mentions': mentions,
      'isLiked': isLiked,
      'isBookmarked': isBookmarked,
    };
  }
}
