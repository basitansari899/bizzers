import 'package:bizconnect/screens/user/registor_otp_page.dart';
import 'package:bizconnect/services/user_service/profile/model/user_data.dart';
import 'package:bizconnect/services/user_service/register/register_repository.dart';
import 'package:bizconnect/utils/exports.dart';

class UserRegisterPageController extends GetxController {
  UserRegisterPageController({required this.registerRepository});
  GlobalKey<FormState> signUpKey = GlobalKey<FormState>();

  final RegisterRepository registerRepository;

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  RxBool loading = RxBool(false);
  RxBool isChecked = RxBool(false);

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

  String? notEmptyValidator(String? value) {
    if (value == null || value.isEmpty || value.trim().isEmpty) {
      return 'Field can not be empty';
    }

    return null;
  }

  Future<void> signUp() async {
    if (signUpKey.currentState!.validate()) {
      loading.value = true;

      final dataObject = UserData(
        fullName: nameController.text,
        email: emailController.text.toLowerCase(),
        password: passwordController.text,
        interest: [""],
      );

      final result = await registerRepository.registerUser(data: dataObject);

      if (result == "Success") {
        Get.snackbar("Success", "User register successfully", backgroundColor: Colors.green);
        loading.value = false;
        Get.to(() => RegistorOtpPage());
      } else {
        Get.snackbar("Error", result, backgroundColor: Colors.red);
      }
      loading.value = false;
    }
  }
}
