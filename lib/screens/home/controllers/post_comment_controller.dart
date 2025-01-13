import 'dart:math';

import 'package:bizconnect/models/comment_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class PostCommentController extends GetxController {
  var commentCount = 0.obs;
  final String postId;
  String currentUser = "";

  PostCommentController({required this.postId});

  @override
  void onInit() {
    super.onInit();
    _getCurrentUserName();
    _listenToCommentCount();
  }

  Future<void> _getCurrentUserName() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid != null) {
      final currentUserNameRef = FirebaseFirestore.instance.collection("users").doc(uid).collection("profile").doc(uid);
      final doc = await currentUserNameRef.get();
      final data = doc.data();
      if (data != null) {
        currentUser = data['fullName'] as String;
      }
    }
  }

  // Check if the current user comment on this post
  Stream<List<CommentModel>> getThisPostComments(String thisPostId) {
    final commentRef = FirebaseFirestore.instance.collection('posts').doc(thisPostId).collection('comments');

    return commentRef.snapshots().map((allComment) {
      return allComment.docs.map((comment) => CommentModel.fromJson(comment.data())).toList();
    });
  }

  // Listen to the like count in real-time
  void _listenToCommentCount() {
    FirebaseFirestore.instance.collection('posts').doc(postId).snapshots().listen((snapshot) {
      if (snapshot.exists) {
        commentCount.value = snapshot.data()?['comments_count'] ?? 0;
      }
    });
  }

  Future<void> saveComment(String content, String userPic) async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) return;
    final postRef = FirebaseFirestore.instance.collection('posts').doc(postId);
    final commentId = postRef.collection('comments').doc().id;
    final commentRef = postRef.collection('comments').doc(commentId);
    
    final data = CommentModel(
      id: commentId,
      user: currentUser,
      content: content,
      userPic: userPic,
      commentType: "Text",
      createdAt: DateTime.now(),
      updateAt: DateTime.now(),
    );

    await commentRef.set(data.toJson());
    commentCount.value++;

    // Update the like count
    await postRef.update({'comments_count': commentCount.value});
  }
}
