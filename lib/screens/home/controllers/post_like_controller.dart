import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class PostLikeController extends GetxController {
  var likeCount = 0.obs;
  var isLiked = false.obs;
  final String postId;

  PostLikeController({required this.postId});

  @override
  void onInit() {
    super.onInit();
    _checkIfLiked();
    _listenToLikeCount();
  }

  // Check if the current user has liked the post
  Future<void> _checkIfLiked() async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId != null) {
      final likeRef = FirebaseFirestore.instance
          .collection('posts')
          .doc(postId)
          .collection('likes')
          .doc(userId);

      final docSnapshot = await likeRef.get();
      isLiked.value = docSnapshot.exists;
    }
  }

  // Listen to the like count in real-time
  void _listenToLikeCount() {
    FirebaseFirestore.instance
        .collection('posts')
        .doc(postId)
        .snapshots()
        .listen((snapshot) {
      if (snapshot.exists) {
        likeCount.value = snapshot.data()?['likeCount'] ?? 0;
      }
    });
  }

  // Toggle like/unlike status
  Future<void> toggleLike() async {
    final userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId == null) return;

    final postRef = FirebaseFirestore.instance.collection('posts').doc(postId);
    final likeRef = postRef.collection('likes').doc(userId);

    if (isLiked.value) {
      // Unlike the post
      await likeRef.delete();
      isLiked.value = false;
      likeCount.value--;
    } else {
      // Like the post
      await likeRef.set({'liked': true});
      isLiked.value = true;
      likeCount.value++;
    }

    // Update the like count
    await postRef.update({'likeCount': likeCount.value});
  }
}
