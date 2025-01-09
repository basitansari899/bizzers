import 'package:bizconnect/services/user_service/auth_repository.dart';
import 'package:bizconnect/services/user_service/firestore_repository.dart';
import 'package:bizconnect/services/user_service/profile/model/user_data.dart';
import 'package:get/get.dart';

class ProfileRepository {
  final AuthRepository authRepository;
  final FirestoreRepository firestoreRepository;

  ProfileRepository({
    required this.authRepository,
    required this.firestoreRepository,
  });

  Future<String> saveProfileSetting({required UserData data}) async {
    try {
      final uid = authRepository.getCurrentUser();

      if (uid == null) return "No current user found!";

      final result = await firestoreRepository.updateUserData(uid, data.toJson());
      return result;
    } catch (e) {
      Get.log(e.toString());
      return e.toString();
    }
  }
}
