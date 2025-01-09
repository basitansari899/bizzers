import 'package:bizconnect/services/user_service/profile/model/user_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class FirestoreRepository {
  final FirebaseFirestore firestore;

  FirestoreRepository({required this.firestore});

  /// local objects
  final _userData = Rxn<UserData>();

  /// Getter and Setter of userData of type Rxn
  UserData? get userDataModel => _userData.value;
  set userDataModel(UserData? model) => _userData.value = model;

  Future<void> initializeDataModels(String uid) async {
    /// Initialze User Data Model of type Rxn
    await getUserData(uid);
  }

  // Save user data
  Future<String> saveUserData(String uid, Map<String, dynamic> data) async {
    try {
      final profileCollection = firestore.collection('users').doc(uid).collection("profile").doc(uid);

      await profileCollection.set(data);

      _userData.value = UserData.fromJson(data);

      return "Success";
    } catch (e) {
      Get.log('Failed to save user data: $e');
      return e.toString();
    }
  }

  // Fetch user data
  Future<void> getUserData(String uid) async {
    try {
      final documentSnapshot = await firestore.collection('users').doc(uid).collection("profile").doc(uid).get();

      final json = documentSnapshot.data();

      if (json != null) {
        _userData.value = UserData.fromJson(json);
      }
    } catch (e) {
      throw Exception('Failed to fetch user data: $e');
    }
  }

  // Update user data
  Future<String> updateUserData(String uid, Map<String, dynamic> data) async {
    try {
      final profileCollection = firestore.collection('users').doc(uid).collection("profile").doc(uid);
      await profileCollection.update(data);
      return "Success";
    } catch (e) {
      Get.log('Failed to update user data: $e');
      return e.toString();
    }
  }

  Future<void> saveProfilePicture(String imagePath, String uid) async {
    try {
      final userProfileCollection = firestore.collection("users").doc(uid).collection("profile").doc(uid);

      await userProfileCollection.update({'picture': imagePath});
      getUserData(uid);
    } catch (e) {
      Get.log(e.toString());
    }
  }
}
