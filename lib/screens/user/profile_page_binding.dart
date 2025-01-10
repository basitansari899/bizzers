import 'package:bizconnect/screens/user/profile_controller.dart';
import 'package:bizconnect/screens/user/user_register_page_controller.dart';
import 'package:bizconnect/services/user_service/register/register_repository.dart';
import 'package:get/get.dart';

class ProfilePageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(
      () => ProfileController(registerRepository: Get.find<RegisterRepository>()),
    );
  }
}