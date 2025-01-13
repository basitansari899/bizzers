// In future we have to add audio in post comment
import 'package:cloud_firestore/cloud_firestore.dart';

enum CommentType { text, sticker, video }

class CommentModel {
  final String id;
  final String user;
  final String content;
  final String userPic;
  final String commentType;
  final DateTime createdAt;
  final DateTime updateAt;

  CommentModel({
    required this.id,
    required this.user,
    required this.content,
    required this.userPic,
    required this.commentType,
    required this.createdAt,
    required this.updateAt,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
        id: json['id'] as String,
        user: json['user'] as String,
        content: json['content'] as String,
        commentType: json['commentType'] as String,
        userPic: json['userPic'] as String,
        createdAt: (json['createdAt'] as Timestamp).toDate(),
        updateAt: (json['updateAt'] as Timestamp).toDate(),
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'user': user,
        'content': content,
        'commentType': commentType,
        'userPic': userPic,
        'createdAt': createdAt,
        'updateAt': updateAt,
      };
}

final List<CommentModel> comments = [
  // CommentModel(
  //     id: "1",
  //     user: "John Doe",
  //     content: "This is a sample text comment.",
  //     commentType: "Text",
  //     createdAt: DateTime.now(),
  //     updateAt: DateTime.now()),
  // CommentModel(
  //   id: "2",
  //   user: "Jane Smith",
  //   content: "https://user-images.githubusercontent.com/74038190/213866269-5d00981c-7c98-46d7-8a8e-16f462f15227.gif", // Assume it's a sticker URL
  //   type: CommentType.sticker,
  //   timestamp: DateTime.now().subtract(Duration(minutes: 3)),
  // ),
  // CommentModel(
  //   id: "3",
  //   user: "Mark Twain",
  //   content: "https://download.quranicaudio.com/quran/abdurrahmaan_as-sudays/001.mp3",
  //   type: CommentType.voice,
  //   timestamp: DateTime.now().subtract(Duration(minutes: 1)),
  // ),
  // CommentModel(
  //   id: "4",
  //   user: "Emily Clark",
  //   content: "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4", // Assume it's a video URL
  //   type: CommentType.video,
  //   timestamp: DateTime.now(),
  // ),
];
