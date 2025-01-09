import 'dart:io';

import 'package:bizconnect/services/user_service/auth_repository.dart';
import 'package:bizconnect/services/user_service/firestore_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class StorageRepository {
  final AuthRepository authRepository;
  final FirestoreRepository firestoreRepository;

  StorageRepository({
    required this.authRepository,
    required this.firestoreRepository,
  });

  final storage = FirebaseStorage.instance;

  Future<String> uploadProfilePic(String picPath) async {
    try {
      final uid = authRepository.getCurrentUser();
      if (uid == null) return "Current User is not logged in";
      final timeStamp = Timestamp.fromMicrosecondsSinceEpoch(2);
      Get.log(timeStamp.toString());
      // Upload image to Firebase Storage
      final ref = storage.ref().child('user_images').child('${uid}_$timeStamp.jpg');
      await ref.putFile(File(picPath));
      final imageUrl = await ref.getDownloadURL();

      await firestoreRepository.saveProfilePicture(imageUrl, uid);
      return "Success";
    } catch (e) {
      return "ERROR: ${e.toString()}";
    }
  }
}
