import 'package:bizconnect/screens/home/bottom_bar_page.dart';
import 'package:bizconnect/screens/user/registor_otp_page.dart';
import 'package:bizconnect/services/user_service/profile/model/user_data.dart';
import 'package:bizconnect/services/user_service/register/register_repository.dart';
import 'package:bizconnect/utils/exports.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRegisterPageController extends GetxController {
  UserRegisterPageController({required this.registerRepository});
  GlobalKey<FormState> signUpKey = GlobalKey<FormState>();
  GlobalKey<FormState> profile = GlobalKey<FormState>();

  final RegisterRepository registerRepository;
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  RxBool loading = RxBool(false);
  RxBool isChecked = RxBool(false);

  final fullNameController = TextEditingController();
  final userNameController = TextEditingController();
  final dobController = TextEditingController();
  final useremailController = TextEditingController();
  final countrController = TextEditingController();
  Rx<String?> selectedCountry = Rx(null);

  List<String> countries = ['United Arab Emirates', 'United States', 'Canada', 'India'];

  @override
  void onInit() {
    super.onInit();
  }

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

  void fetchAndSetUserData() async {
    String userId = auth.currentUser!.uid;
    try {
      final docPath = '/users/$userId/profile/$userId';
      final snapshot = await FirebaseFirestore.instance.doc(docPath).get();

      if (snapshot.exists) {
        final userData = snapshot.data() as Map<String, dynamic>;
        setUserData(userData);
      } else {
        Get.snackbar('Error', 'User data does not exist');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch user data: $e');
    }
  }

  void setUserData(Map<String, dynamic> userData) {
    fullNameController.text = userData['fullName'] ?? '';
    userNameController.text = userData['userName'] ?? '';
    dobController.text = userData['dateOfBirth'] ?? '';
    useremailController.text = userData['email'] ?? '';
    countrController.text = userData['country'] ?? '';
    selectedCountry.value = userData['country']; //
  }

  Future<void> signUp() async {
    if (signUpKey.currentState!.validate()) {
      loading.value = true;

      final dataObject = UserData(
        fullName: nameController.text,
        email: emailController.text.toLowerCase(),
        userId: '',
        password: passwordController.text,
        interest: [""],
      );

      final result = await registerRepository.registerUser(data: dataObject);

      if (result == "Success") {
        Get.snackbar("Success", "User register successfully", backgroundColor: Colors.green);
        loading.value = false;
        Get.to(() => BottomBarPage());
      } else {
        Get.snackbar("Error", result, backgroundColor: Colors.red);
      }
      loading.value = false;
    }
  }

  Future<void> updateProfile() async {
    String userId = auth.currentUser!.uid;
    if (profile.currentState!.validate()) {
      loading.value = true;

      try {
        // Construct the document path
        String docPath = '/users/$userId/profile/$userId';

        // Prepare the updated data
        Map<String, dynamic> updatedData = {
          'fullName': fullNameController.text.trim(),
          'userName': userNameController.text.trim(),
          'dateOfBirth': dobController.text.trim(),
          'country': selectedCountry.value ?? '',
        };

        // Update the Firestore document
        await FirebaseFirestore.instance.doc(docPath).update(updatedData);

        Get.snackbar(
          "Success",
          "Profile updated successfully",
          backgroundColor: Colors.green,
        );
      } catch (e) {
        Get.snackbar(
          "Error",
          "Failed to update profile: $e",
          backgroundColor: Colors.red,
        );
      } finally {
        loading.value = false; // Ensure loading is set to false in all cases
      }
    }
  }
}
