import 'package:bizconnect/screens/home/bottom_bar_page.dart';
import 'package:bizconnect/services/user_service/login/login_repository.dart';
import 'package:bizconnect/utils/exports.dart';

class LoginPageController extends GetxController {
  LoginPageController({required this.loginRepository});

  final LoginRepository loginRepository;

  GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();

  RxBool loading = RxBool(false);
  RxBool termsAndCondition = RxBool(false);

  String? emailValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email Field is required';
    } else if (!GetUtils.isEmail(value)) {
      return 'Input right email format';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password Field is required';
    }
    final hasMinLength = value.length >= 8;
    if (!hasMinLength) {
      return 'Password length error';
    }
    return null;
  }

  Future<void> loginUser() async {
    if (loginKey.currentState!.validate()) {
      loading.value = true;
      final result = await loginRepository.loginAndFetchUserData(email.text.toLowerCase(), password.text);
      if (result == "Success") {
        Get.snackbar("Success", "User login successfully", backgroundColor: Colors.green);
        loading.value = false;
        Get.offAll(() => BottomBarPage());
      } else {
        Get.snackbar("Error", result, backgroundColor: Colors.red);
      }
      loading.value = false;
    }
  }

  Future<void> loginWithGoogle() async {}

  Future<void> loginWithFacebook() async {}

  Future<void> loginWithLinkedIn() async {}
}
