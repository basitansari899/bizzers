import 'package:bizconnect/screens/learning/core/app_export.dart';
import 'package:bizconnect/services/user_service/profile/model/user_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProfileController extends GetxController {
  Future<UserData?> getUserData(String userId) async {
    final userRef = FirebaseFirestore.instance.collection("users").doc(userId);
    final doc = await userRef.get();
    final userJson = doc.data();
    if (userJson != null) {
      return UserData.fromJson(userJson);
    } else {
      return null;
    }
  }
}
