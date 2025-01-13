import 'dart:io';

import 'package:bizconnect/res/mixin_loading.dart';
import 'package:bizconnect/services/user_service/register/register_repository.dart';
import 'package:bizconnect/utils/exports.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController with LoadingMixin {
  ProfileController({required this.registerRepository});
  GlobalKey<FormState> signUpKey = GlobalKey<FormState>();
  GlobalKey<FormState> profile = GlobalKey<FormState>();

  final RegisterRepository registerRepository;
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  RxString profilePic = RxString("");
  RxString userNameFirstLetter = RxString("A");
  // RxBool loading = RxBool(false);
  RxBool isChecked = RxBool(false);

  final fullNameController = TextEditingController();
  final userNameController = TextEditingController();
  final dobController = TextEditingController();
  final userEmailController = TextEditingController();
  final countryController = TextEditingController();
  Rx<String?> selectedCountry = Rx(null);
  final picker = ImagePicker();

  List<String> countries = ['United Arab Emirates', 'United States', 'Canada', 'India'];

  @override
  void onInit() {
    fetchAndSetUserData();
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
    loading.value = true;
    String userId = auth.currentUser!.uid;
    try {
      final docPath = '/users/$userId/profile/$userId';
      final snapshot = await firestore.doc(docPath).get();

      if (snapshot.exists) {
        final userData = snapshot.data() as Map<String, dynamic>;
        setUserData(userData);
      } else {
        Get.snackbar('Error', 'User data does not exist');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch user data: $e');
    }
    loading.value = false;
  }

  void setUserData(Map<String, dynamic> userData) {
    fullNameController.text = userData['fullName'] ?? '';
    userNameController.text = userData['userName'] ?? '';
    dobController.text = userData['dateOfBirth'] ?? '';
    userEmailController.text = userData['email'] ?? '';
    countryController.text = userData['country'] ?? '';
    profilePic.value = userData['profilePic'];
    selectedCountry.value = userData['country']; //
    userNameFirstLetter.value = fullNameController.text[0].capitalize!;
  }

  Future<void> pickImage() async {
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        loading.value = true;
        final uid = auth.currentUser!.uid;
        final timeStamp = Timestamp.now();

        final ref = FirebaseStorage.instance.ref().child("users_images").child('${uid}_$timeStamp.jpg');

        await ref.putFile(File(pickedFile.path));

        profilePic.value = await ref.getDownloadURL();

        await firestore
            .collection('users')
            .doc(uid)
            .collection('profile')
            .doc(uid)
            .update({'profilePic': profilePic.value});
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        '$e',
        backgroundColor: Colors.red,
        colorText: Colors.black,
      );
    } finally {
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
