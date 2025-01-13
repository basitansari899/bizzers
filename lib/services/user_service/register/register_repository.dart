import 'package:bizconnect/services/user_service/auth_repository.dart';
import 'package:bizconnect/services/user_service/firestore_repository.dart';
import 'package:bizconnect/services/user_service/profile/model/user_data.dart';

class RegisterRepository {
  final AuthRepository authRepository;
  final FirestoreRepository firestoreRepository;

  RegisterRepository({
    required this.authRepository,
    required this.firestoreRepository,
  });

  Future<String> registerUser({
    required UserData data,
  }) async {
    String result = await authRepository.emailRegistration(data.email, data.password);

    final uid = authRepository.getCurrentUser();

    if (result == "Success" && uid != null) {
      final firestore = firestoreRepository.firestore;
      final collection = firestore.collection("users").doc(uid).collection("profile").doc(uid);

      await collection.set(data.toJson());
      await collection.set({'userId': uid});
    }

    return result;
  }

  void saveUserDataModel(UserData userData) => firestoreRepository.userDataModel = userData;
}
