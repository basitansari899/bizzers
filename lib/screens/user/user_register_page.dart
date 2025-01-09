import 'package:bizconnect/screens/user/user_register_page_controller.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/exports.dart';

class UserRegisterPage extends GetView<UserRegisterPageController> {
  const UserRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Text(
                  'Register',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFDAA520),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'It was popularized in the 1960s with the release of Letraset sheets containing Lorem Ipsum.',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
                SizedBox(height: 40),
                Form(
                  key: controller.signUpKey,
                  child: Column(
                    spacing: 20,
                    children: [
                      _buildTextField(
                        label: "Name",
                        icon: BootstrapIcons.person,
                        controller: controller.nameController,
                        validator: controller.notEmptyValidator,
                      ),
                      _buildTextField(
                        label: "Email",
                        icon: BootstrapIcons.envelope,
                        controller: controller.emailController,
                        validator: controller.emailValidator,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      _buildTextField(
                        label: "Password",
                        icon: BootstrapIcons.lock,
                        isPassword: true,
                        controller: controller.passwordController,
                        validator: controller.passwordValidator,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Checkbox(
                      value: controller.isChecked.value,
                      activeColor: primaryColor,
                      onChanged: (value) => controller.isChecked.value = value!,
                    ),
                    Expanded(
                      child: Text(
                        "I'm agree to the Terms of Service and Privacy Policy",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                InkWell(
                  onTap: () => controller.signUp(), //Get.to(() => RegisterOtpPage()),
                  child: Obx(
                    () => Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(0xFFDAA520),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: controller.loading.value
                          ? CircularProgressIndicator()
                          : Center(
                              child: Text(
                                'Create Account',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: GestureDetector(
                    onTap: () => Get.back(),
                    child: Text(
                      'Do you have an account? Login',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        color: Color(0xFFDAA520),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required IconData icon,
    required TextEditingController controller,
    required FormFieldValidator<String?> validator,
    TextInputType keyboardType = TextInputType.name,
    bool isPassword = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.poppins(fontSize: 16),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: ShapeDecoration(
            color: Color(0xFFF5F9FD),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          child: TextFormField(
            obscureText: isPassword,
            controller: controller,
            validator: validator,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              constraints: const BoxConstraints(minHeight: 60),
              prefixIcon: Icon(icon, color: Colors.amber[700]),
              filled: false,
              fillColor: Colors.grey[200],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.amber[700]!),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.amber[700]!),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
