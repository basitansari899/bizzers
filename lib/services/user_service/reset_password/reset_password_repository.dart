import 'package:bizconnect/services/user_service/auth_repository.dart';

class ResetPasswordRepository {
  final AuthRepository authRepository;

  ResetPasswordRepository({required this.authRepository});

  Future<void> resetPassword(String email) async {
    await authRepository.resetPassword(email);
  }
}
