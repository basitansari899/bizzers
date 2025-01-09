import 'package:bizconnect/services/user_service/auth_repository.dart';
import 'package:bizconnect/services/user_service/firestore_repository.dart';

class LoginRepository {
  final AuthRepository authRepository;
  final FirestoreRepository firestoreRepository;

  LoginRepository({
    required this.authRepository,
    required this.firestoreRepository,
  });

  Future<String> loginAndFetchUserData(String email, String password) async {
    String result = await authRepository.login(email, password);
    final uid = authRepository.getCurrentUser();

    if (result == "Success" && uid != null) {
      await firestoreRepository.getUserData(uid);
    }
    return result;
  }
}
