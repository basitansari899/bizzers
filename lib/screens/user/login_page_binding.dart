import 'package:bizconnect/screens/user/login_page_controller.dart';
import 'package:bizconnect/services/user_service/login/login_repository.dart';
import 'package:get/get.dart';

class LoginPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginPageController>(
      () => LoginPageController(loginRepository: Get.find<LoginRepository>()),
    );
  }
}
