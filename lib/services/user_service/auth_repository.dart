import 'package:bizconnect/screens/learning/routes/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthRepository {
  final FirebaseAuth firebaseAuth;

  AuthRepository({required this.firebaseAuth});

  // Login
  Future<String> login(String email, String password) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return "Success";
    } on FirebaseAuthException catch (authError) {
      Get.log("${authError.code}: ${authError.message}");
      return authError.message ?? "Unknown error occurred";
    } catch (e) {
      Get.log(e.toString());
      return e.toString();
    }
  }

  // Register with email
  Future<String> emailRegistration(String email, String password) async {
    try {
      await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return "Success";
    } on FirebaseAuthException catch (authError) {
      switch (authError.code) {
        case 'email-already-in-use':
          return "This email is already registered. Please try logging in.";
        case 'weak-password':
          return "The password is too weak. Please choose a stronger password.";
        default:
          return authError.message ?? "Authentication error occurred.";
      }
    } catch (e) {
      Get.log(e.toString());
      return "Failed to register user. Please try again.";
    }
  }

  // Reset Password
  Future<String> resetPassword(String email) async {
    try {
      await firebaseAuth.sendPasswordResetEmail(email: email);
      return "Success";
    } catch (e) {
      Get.log('Failed to reset password: $e');
      return e.toString();
    }
  }

  // Logout
  Future<void> logout() async {
    try {
      await firebaseAuth.signOut();
      Get.offAllNamed(AppRoutes.login);
    } catch (e) {
      throw Exception('Failed to log out: $e');
    }
  }

  // Get current user
  String? getCurrentUser() {
    return firebaseAuth.currentUser?.uid;
  }
}
