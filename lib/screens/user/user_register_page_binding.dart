import 'package:bizconnect/screens/user/user_register_page_controller.dart';
import 'package:bizconnect/services/user_service/register/register_repository.dart';
import 'package:get/get.dart';

class UserRegisterPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UserRegisterPageController>(
      () => UserRegisterPageController(registerRepository: Get.find<RegisterRepository>()),
    );
  }
}
