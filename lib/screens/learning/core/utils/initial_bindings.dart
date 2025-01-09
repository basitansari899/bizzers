import 'package:bizconnect/services/user_service/auth_repository.dart';
import 'package:bizconnect/services/user_service/firestore_repository.dart';
import 'package:bizconnect/services/user_service/login/login_repository.dart';
import 'package:bizconnect/services/user_service/register/register_repository.dart';
import 'package:bizconnect/services/user_service/reset_password/reset_password_repository.dart';
import 'package:bizconnect/services/user_service/storage_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../data/apiClient/api_client.dart';
import '../app_export.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    // Register dependencies
    Get.put(AuthRepository(firebaseAuth: auth));
    Get.put(FirestoreRepository(firestore: firestore));

    Get.put(LoginRepository(
      authRepository: Get.find<AuthRepository>(),
      firestoreRepository: Get.find<FirestoreRepository>(),
    ));

    Get.put(RegisterRepository(
      authRepository: Get.find<AuthRepository>(),
      firestoreRepository: Get.find<FirestoreRepository>(),
    ));

    Get.put(StorageRepository(
      authRepository: Get.find<AuthRepository>(),
      firestoreRepository: Get.find<FirestoreRepository>(),
    ));

    Get.put(ResetPasswordRepository(
      authRepository: Get.find<AuthRepository>(),
    ));

    Get.put(PrefUtils());
    Get.put(ApiClient());
  }
}
